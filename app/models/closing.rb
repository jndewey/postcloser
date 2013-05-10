class Closing < ActiveRecord::Base
  attr_accessible :client_number, :closing_date, :messages, :closing_status, :deal_type, :dealname, :team_member, :inside_member, :matter_number, :outside_member, :team_leader

  belongs_to :user

  has_many  :closing_items

  has_many :tasks, :through => :closing_items

  serialize :team_member


end
