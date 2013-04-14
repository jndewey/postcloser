class ClosingItem < ActiveRecord::Base
  attr_accessible :author, :files, :notes, :tasks, :title, :dealname, :closing_id

 belongs_to :closing


end
