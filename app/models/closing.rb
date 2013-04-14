class Closing < ActiveRecord::Base
  attr_accessible :content, :dealname, :user_id, :team_leader, :Bank_Closer, :relationship_manager, :team_member_one, :team_member_two, :team_member_three, :team_member_four, :team_member_five, :borrower_counsel_one, :borrower_counsel_two, :closing_date

  belongs_to :user

    has_many  :closing_items

  

end
