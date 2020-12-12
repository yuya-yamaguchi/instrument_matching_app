class Api::InstructorsController < ApplicationController

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
