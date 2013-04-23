class ClosingItem < ActiveRecord::Base
  attr_accessible :author, :files, :notes, :tasks, :title, :dealname, :closing_id, :status

belongs_to :closing

has_many :tasks


end
