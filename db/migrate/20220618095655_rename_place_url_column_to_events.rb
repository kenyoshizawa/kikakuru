class RenamePlaceUrlColumnToEvents < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :place_url, :place
  end
end
