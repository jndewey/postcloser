class Closing < ActiveRecord::Base
  attr_accessible :content, :dealname, :user_id
  belongs_to :user
end
