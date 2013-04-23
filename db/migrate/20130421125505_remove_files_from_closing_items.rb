class RemoveFilesFromClosingItems < ActiveRecord::Migration
  def up
    remove_column :closing_items, :files
  end

  def down
    add_column :closing_items, :files, :string
  end
end
