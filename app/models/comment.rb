class Comment < ApplicationRecord

  belongs_to :user
	belongs_to :travel
  validates  :travel_comment, presence: true
end
