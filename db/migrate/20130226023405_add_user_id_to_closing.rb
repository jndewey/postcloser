class AddUserIdToClosing.rb < ActiveRecord::Migration
  def change
    add_column :closings, :user_id, :integer
    add_index :closings, :user_id
    remove_column :closings, :name
  end
end
	