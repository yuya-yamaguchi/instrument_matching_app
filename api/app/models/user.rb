class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :boards
  has_one  :instructor
  has_many :apply_boards
  has_many :user_apply_boards, through: :apply_boards, source: :board
  has_many :entry_rooms
  has_many :message_rooms, through: :entry_rooms
  has_many :messages
end
