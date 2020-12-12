class Api::InstructorsController < ApplicationController

  def index
    out_params = []
    # PENDING テーブル結合できないか？？
    instructors = Instructor.all
    # 講師ごとのユーザ情報を取得
    instructors.each do |instructor|
      user = instructor.user
      out_params << instructor.set_instructor_params(user)
    end
    render json: out_params
  end

  def show
    applied_flg = false
    instructor = Instructor.find(params[:id])
    user = instructor.user
    out_params = instructor.set_instructor_params(user)
    render json: { instructor: out_params }
  end

  def create
    instructor = Instructor.new(instructor_params)
    if instructor.save
      render status: 200
    else
      render status: 500
    end
  end

  private
  def instructor_params
    params.require(:instructor).permit(:title, :details).merge(user_id: params[:user_id])
  end
end
