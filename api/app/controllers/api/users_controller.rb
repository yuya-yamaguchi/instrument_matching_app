class Api::UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    boards = user.boards
    boards_params = []
    boards.each do |board|
      boards_params << board.set_posted_board_params(user)
    end
    render json: { user: user, boards: boards_params }
  end
  
  def mypage
    user = User.find_by(uid: params[:uid])
    boards = user.boards
    boards_params = []
    boards.each do |board|
      boards_params << board.set_posted_board_params(user)
    end
    render json: { user: user, boards: boards_params }
  end

end
