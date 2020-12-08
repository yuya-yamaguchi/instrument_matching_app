class Api::BoardsController < ApplicationController

  def index
    out_params = []
    boards = Board.all
    # boardsテーブルに紐付くuser情報を取得
    boards.each do |board|
      user = board.user
      out_params << set_home_params(user, board)
    end
    
    render json: out_params
  end

  def show
    board = Board.find(params[:id])
    user = board.user
    out_params = set_home_params(user, board)

    render json: out_params
  end

  def create
    # binding.pry
    @board = Board.new(board_params)
    @board.user_id = 1
    @board.instrument_id = 1
    if @board.save
      render json: "create new board.\n", status: 200
    else
      render json: "fail to create.\n", status: 500
    end
  end

  private
  def board_params
    params.permit(:title, :detail)
  end
  
  def set_home_params(user, board)
    params = {
      id:       board.id,
      title:    board.title,
      detail:   board.detail,
      username: user.name
    }
  end
end
