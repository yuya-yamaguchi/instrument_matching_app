class ChangeDataDetailToBoards < ActiveRecord::Migration[6.0]
  def change
    change_column :boards, :detail, :text
  end
end
