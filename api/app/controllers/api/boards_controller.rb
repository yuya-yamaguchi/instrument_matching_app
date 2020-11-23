class Api::BoardsController < ApplicationController

  def index
    @boards = Board.all
    render json: @boards
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

  private
    def board_params
      params.require(:board).permit(:title, :explain)
    end
    
end
