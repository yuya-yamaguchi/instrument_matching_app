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
    my_boards_params = []
    apply_boards_params = []
    
    user = User.find_by(uid: params[:uid])
    # ログインユーザが申込済のboardsを取得
    my_boards = user.boards
    my_boards.each do |board|
      my_boards_params << board.set_posted_board_params(user)
    end
    # ログインユーザが募集したboardsを取得
    apply_boards = user.user_apply_boards
    apply_boards.each do |board|
      apply_boards_params << board.set_posted_board_params(board.user)
    end

    render json: { user:         user,
                   my_boards:    my_boards_params,
                   apply_boards: apply_boards_params,
                 }
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
