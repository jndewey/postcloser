class AddTeamLeaderToClosings < ActiveRecord::Migration
  def change
    add_column :closings, :team_leader, :string
  end
end
