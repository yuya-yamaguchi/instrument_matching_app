class MessageRoom < ApplicationRecord
  has_many :entry_rooms
  has_many :users, through: :entry_rooms
  has_many :messages
end
