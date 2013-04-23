class AddClosingIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :closingitem_id, :integer
  end
end
