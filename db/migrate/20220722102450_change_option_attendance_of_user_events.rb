class ChangeOptionAttendanceOfUserEvents < ActiveRecord::Migration[5.2]
  def up
    change_column :user_events, :attendance, :boolean, default: false, null: false
  end

  def down
    change_column :user_events, :attendance, :boolean, default: false
  end
end
