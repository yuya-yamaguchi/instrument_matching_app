class Instructor < ApplicationRecord

  belongs_to :user
  has_many   :reserves
  has_many   :reserve_settings

  def set_instructor_params(user)
    params = {
      id:        self.id,
      user_id:   self.user_id,
      title:     self.title,
      details:   self.details,
      user_name: user.name
    }
  end
end
