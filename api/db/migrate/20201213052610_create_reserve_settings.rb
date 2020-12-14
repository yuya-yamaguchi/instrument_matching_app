class CreateReserveSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :reserve_settings do |t|
      t.references :instructor, null: false
      t.integer    :week, null: false
      t.integer    :hour, null: false
      t.integer    :minute, null: false, default: 0
      t.boolean    :reservable_flg, null: false, default: 0
      t.timestamps
    end
  end
end
