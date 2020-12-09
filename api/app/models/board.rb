class Board < ApplicationRecord
  belongs_to :user

  def set_posted_board_params(user)
    params = {
      id:       self.id,
      title:    self.title,
      detail:   self.detail,
      username: user.name
    }
  end
end
