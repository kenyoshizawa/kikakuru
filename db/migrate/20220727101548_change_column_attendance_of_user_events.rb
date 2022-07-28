class ChangeColumnAttendanceOfUserEvents < ActiveRecord::Migration[5.2]
  def up
    change_column :user_events, :attendance, :integer, default: 0, null: false
  end

  def down
    change_column :user_events, :attendance, :boolean, default: false, null: false
  end
end
