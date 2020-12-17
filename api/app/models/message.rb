class Message < ApplicationRecord
  belongs_to :user
  belongs_to :message_room

  attr_accessor :date

  def set_out_params
    params = {
      user_id: self.user_id,
      text: self.text,
      date: self.created_at.strftime("%Y年%m月%d日 %H:%M:%S")
    }
  end
end
