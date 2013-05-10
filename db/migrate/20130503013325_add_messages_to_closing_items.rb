class AddMessagesToClosingItems < ActiveRecord::Migration
  def change
    add_column :closing_items, :messages, :string
  end
end
