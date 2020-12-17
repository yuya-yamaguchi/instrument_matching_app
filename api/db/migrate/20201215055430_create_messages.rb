class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :user, null: false
      t.references :message_room, null: false
      t.text       :text, null: false
      t.boolean    :read_flg, default: false
      t.timestamps
    end
  end
end
