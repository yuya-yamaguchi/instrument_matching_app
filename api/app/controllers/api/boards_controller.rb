class Api::BoardsController < ApplicationController

  def index
    out_params = []
    boards = Board.all
    # boardsテーブルに紐付くuser情報を取得
    boards.each do |board|
      user = board.user
      out_params << board.set_posted_board_params(user)
    end
    
    render json: out_params
  end

  def show
    applied_flg = false
    board = Board.find(params[:id])
    apply_board = ApplyBoard.where(user_id: params[:user_id]).where(board_id: params[:id])
    # binding.pry
    if apply_board.length > 0
      applied_flg = true
    end
    user = board.user
    out_params = board.set_posted_board_params(user)

    render json: {board: out_params, applied: applied_flg}
  end

  def create
    @board = Board.new(board_params)
    @board.user_id = 1
    @board.instrument_id = 1
    if @board.save
      render json: "create new board.\n", status: 200
    else
      render json: "fail to create.\n", status: 500
    end
  end

  def apply
    # binding.pry
    apply_board = ApplyBoard.new(board_id: params[:id], user_id: params[:user_id])
    if apply_board.save
      render status: 200
    else
      render status: 500
    end
  end

  private
  def board_params
    params.permit(:title, :detail)
  end
end
