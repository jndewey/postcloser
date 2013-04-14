class AddDealNameToClosingItems < ActiveRecord::Migration
  def change
    add_column :closing_items, :dealname, :string
  end
end
