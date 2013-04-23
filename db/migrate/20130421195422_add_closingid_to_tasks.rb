class AddClosingidToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :closing_item_id, :integer
  end
end
