class DropTask < ActiveRecord::Migration[5.2]
  def up
    drop_table :tasks
  end

  def down
    create_table :tasks do |t|
      t.string "title"
      t.integer "status"
      t.timestamps
    end
  end
end
