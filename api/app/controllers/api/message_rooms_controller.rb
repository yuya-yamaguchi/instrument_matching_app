class Api::MessageRoomsController < ApplicationController

  def index
    out_params = []
    user = User.find(params[:user_id])
    message_rooms = user.message_rooms
    message_rooms.each do |message_room|
      user = message_room.users.where.not(id: params[:user_id])
      latest_message = message_room.messages.order(updated_at: :desc).limit(1)
      out_params << message_room.set_out_params(user.first.name, latest_message.first)
    end
    render json: out_params
  end
  
  def show
    out_params = []
    message_room = MessageRoom.find(params[:id])
    messages = message_room.messages
    reserver = message_room.users.where.not(id: params[:user_id])
    messages.each do |message|
      out_params << message.set_out_params
    end
    render json: out_params
  end

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
