class People < ActiveRecord::Base
  has_many :jobs
  has_many :events, through: :jobs
end

