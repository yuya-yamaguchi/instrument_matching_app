class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.integer :user_id, null: false, default: 0
      t.integer :instrument_id, null: false, default: 0
      t.string :title, null: false, default: ""
      t.string :explain, null: false, default: ""
      t.string :image, default: ""
      t.timestamps
    end
  end
end
