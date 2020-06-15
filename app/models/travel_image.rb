class TravelImage < ApplicationRecord

  belongs_to :travel
  mount_uploader :image_url, ImageUrlUploader

  validates :image_url, presence: true
end
