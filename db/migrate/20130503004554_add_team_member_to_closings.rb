class AddTeamMemberToClosings < ActiveRecord::Migration
  def change
    add_column :closings, :team_member, :text
  end
end
