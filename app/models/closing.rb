class Closing < ActiveRecord::Base
  attr_accessible :content, :dealname, :user_id, :teammember
  belongs_to :user

end
