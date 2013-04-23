class RemoveTasksFromClosings < ActiveRecord::Migration
  def up
    remove_column :closings, :tasks
  end

  def down
    add_column :closings, :tasks, :string
  end
end
