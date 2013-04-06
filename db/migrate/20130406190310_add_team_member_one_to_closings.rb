class AddTeamMemberOneToClosings < ActiveRecord::Migration
  def change
    add_column :closings, :team_member_one, :string
  end
end
