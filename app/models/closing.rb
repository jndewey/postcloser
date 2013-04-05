class Closing < ActiveRecord::Base
  attr_accessible :content, :dealname, :user_id, :teammember, :team_leader, :Bank_Closer, :relationship_manager
  belongs_to :user

   

end
