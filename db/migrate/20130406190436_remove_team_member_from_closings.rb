class RemoveTeamMemberFromClosings < ActiveRecord::Migration
  def up
    remove_column :closings, :teammember
  end

  def down
    add_column :closings, :teammember, :string
  end
end
