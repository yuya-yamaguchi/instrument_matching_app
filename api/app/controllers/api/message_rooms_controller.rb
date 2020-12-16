class Api::MessageRoomsController < ApplicationController

  def create
    instructor = Instructor.find(params[:instructor_id])
    user = User.find(params[:user_id])
    belong_room = EntryRoom.where('user_id in (?, ?)', params[:user_id], instructor.user_id)
                           .group(:message_room_id)
                           .having('count(*) > ?', 1)
                           .count
    # message_roomが未作成の場合
    if belong_room.empty?
      message_room_params = {user_ids: [params[:user_id], instructor.user_id]}
      @message_room = MessageRoom.create!(message_room_params)
    # message_roomが作成済の場合
    else
      message_room_id = belong_room.first[0]
      @message_room = MessageRoom.find(message_room_id)
    end
    messages = @message_room.messages.new(message_params)
    messages.save
    render json: @message_room
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: params[:user_id])
  end
end
