class CreateApplyBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :apply_boards do |t|
      t.references :user, null: false
      t.references :board, null: false
      t.boolean    :contracted_flg, default: false
      t.timestamps
    end
  end
end
