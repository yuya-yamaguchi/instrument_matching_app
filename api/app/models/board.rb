class Board < ApplicationRecord
  belongs_to :user
  has_many :apply_boards

  def set_posted_board_params(user)
    params = {
      id:       self.id,
      title:    self.title,
      detail:   self.detail,
      user_id:  user.id,
      username: user.name
    }
  end
end
