class Job < ActiveRecord::Base
  belongs_to :event
  belongs_to :people
end
