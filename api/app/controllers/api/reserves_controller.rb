class Api::ReservesController < ApplicationController

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
end
