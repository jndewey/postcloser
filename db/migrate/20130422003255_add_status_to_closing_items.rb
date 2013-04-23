class AddStatusToClosingItems < ActiveRecord::Migration
  def change
    add_column :closing_items, :status, :boolean
  end
end
