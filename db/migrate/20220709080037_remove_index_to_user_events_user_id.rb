class RemoveIndexToUserEventsUserId < ActiveRecord::Migration[5.2]
  def change
    remove_index :user_events, :user_id
  end
end
