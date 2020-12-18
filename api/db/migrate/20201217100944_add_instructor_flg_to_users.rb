class AddInstructorFlgToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :instructor_flg, :boolean, default: false
  end
end
