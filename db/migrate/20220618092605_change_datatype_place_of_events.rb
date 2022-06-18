class ChangeDatatypePlaceOfEvents < ActiveRecord::Migration[5.2]
  def up
    change_column :events, :place, :text, null: false
  end

  def down
    change_column :events, :place, :string, null: false
  end
end
