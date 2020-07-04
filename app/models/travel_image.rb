class TravelImage < ApplicationRecord

  belongs_to :travel
  has_many :tags, dependent: :destroy
  mount_uploader :image_url, ImageUrlUploader

  validates :image_url, presence: true
end
