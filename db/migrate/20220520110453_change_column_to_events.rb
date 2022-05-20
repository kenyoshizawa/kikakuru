class ChangeColumnToEvents < ActiveRecord::Migration[5.2]
  def up
    change_column :events, :started_at, :time, null: false
    change_column :events, :finished_at, :time, null: false
  end

  def down
    change_column :events, :started_at, :datetime, null: false
    change_column :events, :finished_at, :datetime, null: false
  end
end
