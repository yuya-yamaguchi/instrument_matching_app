class CreateInstructors < ActiveRecord::Migration[6.0]
  def change
    create_table :instructors do |t|
      t.references :user, null: false
      t.string     :title, null: false
      t.text       :details, null: false
      t.timestamps
    end
  end
end
