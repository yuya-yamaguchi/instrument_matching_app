class MessageRoom < ApplicationRecord
  has_many :entry_rooms
  has_many :users, through: :entry_rooms
  has_many :messages

  def set_out_params(reserver_name, latest_message)
    params = { 
      id:             self.id,
      reserver_name:  reserver_name,
      latest_message: latest_message.text,
      update_date:    latest_message.created_at.strftime("%Y年%m月%d日 %H:%M:%S")
    }
  end
end
