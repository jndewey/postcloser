class RemoveClosingidFromTasks < ActiveRecord::Migration
  def up
    remove_column :tasks, :closingitem_id
  end

  def down
    add_column :tasks, :closingitem_id, :integer
  end
end
