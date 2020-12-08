class AddForeignkeyToBoards < ActiveRecord::Migration[6.0]
  def change
    change_column   :boards, :user_id, :bigint
    add_foreign_key :boards, :users
  end
end
