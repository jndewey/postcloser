class AddTeamMembersToClosings < ActiveRecord::Migration
  def change
    add_column :closings, :team_member_two, :string
    add_column :closings, :team_member_three, :string
    add_column :closings, :team_member_four, :string
    add_column :closings, :team_member_five, :string
  end
end
