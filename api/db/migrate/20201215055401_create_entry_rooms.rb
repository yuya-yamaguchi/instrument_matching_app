class CreateEntryRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :entry_rooms do |t|
      t.references :user, null: false
      t.references :message_room, null: false
      t.timestamps
    end
  end
end
