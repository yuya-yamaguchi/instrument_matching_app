class Api::ReservesController < ApplicationController

  def index
    reserve_settings = []
    reserve_settings_params = []
    weeks = []
    today = Date.today
    week = today.wday
    weeks = []
    loop do
      weeks << week
      week += 1
      week = 0 if week > 6
      break if weeks.length >= 7
    end
    instructor = Instructor.find(params[:instructor_id])
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
    render json: { reserve_settings: reserve_settings }
  end

  def create
    reserve = Reserve.new(reserve_params)
    if reserve.save
      render status: 200
    else
      render status: 500
    end
  end

  private
  def reserve_params
    params.require(:reserve).permit(:user_id, :instructor_id, :date, :week, :hour)
  end

  def order_query(column_values)
    column_values.each.with_index(1).inject('CASE week ') do |order_query, (column_value, index)|
      order_query << "WHEN #{column_value} THEN #{index} "
    end << 'END'
  end
end
