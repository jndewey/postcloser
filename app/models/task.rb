class Task < ActiveRecord::Base
  attr_accessible :author, :deadline, :name, :status, :assignee

belongs_to :closing_item

belongs_to :user


end

