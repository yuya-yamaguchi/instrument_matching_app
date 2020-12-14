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
    reserve_settings = []
    reserve_settings_params = []
    weeks = []
    instructor = Instructor.find(params[:id])
    user = instructor.user
    out_params = instructor.set_instructor_params(user)
    today = Date.today
    week = today.wday
    weeks = []
    loop do
      weeks << week
      week += 1
      week = 0 if week > 6
      break if weeks.length >= 7
    end
    24.times do |i|
      reserve_settings << instructor.reserve_settings.where(hour: i).order(order_query(weeks))
    end
    
    reserve_settings.each do |reserve_setting|
      reserve_setting.each_with_index do |r, j|
        if r.reservable_flg == true
          reserve = Reserve.where(instructor_id: instructor.id).where(hour: r.hour).where(date: today+j)
          if reserve.length > 0
            r.reservable_flg = false
          end
        end
      end
    end
    render json: { instructor: out_params, reserve_settings: reserve_settings }
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

  def order_query(column_values)
    column_values.each.with_index(1).inject('CASE week ') do |order_query, (column_value, index)|
      order_query << "WHEN #{column_value} THEN #{index} "
    end << 'END'
  end
end
