class Closing < ActiveRecord::Base
  attr_accessible :client_number, :closing_date, :closing_status, :deal_type, :dealname, :inside_member, :matter_number, :outside_member, :team_leader

  belongs_to :user

  has_many  :closing_items

  has_many :tasks, :through => :closing_items

end
