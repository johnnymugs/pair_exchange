class Listing < ActiveRecord::Base
  attr_accessible :body

  belongs_to :user
  validates :user, presence: true
end
