class CreateReserves < ActiveRecord::Migration[6.0]
  def change
    create_table :reserves do |t|
      t.references :user, null: false
      t.references :instructor, null: false
      t.date       :date, null: false
      t.integer    :week, null: false
      t.integer    :hour, null: false
      t.integer    :minute, null: false, default: 0
      t.integer    :fee, null: false, default: 0
      t.timestamps
    end
  end
end
