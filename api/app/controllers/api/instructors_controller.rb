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
    instructor = Instructor.find(params[:id])
    user = instructor.user
    out_params = instructor.set_instructor_params(user)
    
    render json: { instructor: out_params }
  end

  def create
    instructor = Instructor.new(instructor_params)
    if instructor.save
      # PENDING トランザクションを考慮する
      7.times do |i|
        24.times do |j|
          reserve_setting = ReserveSetting.new(instructor_id: instructor.id,
                                               week: i,
                                               hour: j,
                                               reservable_flg: 1)
          reserve_setting.save
        end
      end
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
