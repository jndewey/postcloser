class RemoveTasksFromClosingItems < ActiveRecord::Migration
  def up
    remove_column :closing_items, :tasks
  end

  def down
    add_column :closing_items, :tasks, :string
  end
end
