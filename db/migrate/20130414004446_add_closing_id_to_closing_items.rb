class AddClosingIdToClosingItems < ActiveRecord::Migration
  def change
    add_column :closing_items, :closing_id, :integer
  end
end
