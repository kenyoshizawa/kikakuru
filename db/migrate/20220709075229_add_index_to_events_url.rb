class AddIndexToEventsUrl < ActiveRecord::Migration[5.2]
  def change
    add_index :events, :url
  end
end
