class CreateUserEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :user_events do |t|
      t.references :user, foreign_key: true, null: false
      t.references :event, foreign_key: true, null: false
      t.boolean :attendance, default: false

      t.timestamps
    end
    add_index :user_events, [:user_id, :event_id], unique: true
  end
end
