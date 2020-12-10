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
  
  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render status: 200
    else
      render status: 500
    end
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

  def profile
    user = User.find_by(uid: params[:uid])
    render json: user
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile)
  end

end
