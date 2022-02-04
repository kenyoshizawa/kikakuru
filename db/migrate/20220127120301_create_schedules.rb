class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.datetime :date, null: false
      t.references :event, foreign_key: true, null: false

      t.timestamps
    end
  end
end
