class Api::MessagesController < ApplicationController

  def create
    message_room = MessageRoom.find(params[:message_room_id])
    message = message_room.messages.new(message_params)
    if message.save
      out_params = message.set_out_params
      render json: out_params
    end
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: params[:user_id])
  end
end
