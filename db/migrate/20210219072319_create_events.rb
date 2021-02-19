class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.string :place, null: false
      t.datetime :started_at, null: false
      t.datetime :finished_at, null: false
      t.datetime :deadlined_at, null: false
      t.string :url, null: false
      t.datetime :deleted_at
      t.string :deleted_message

      t.timestamps
    end
  end
end
