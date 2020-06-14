class Travel < ApplicationRecord

  has_many   :travel_images, dependent: :destroy
  belongs_to :user
  has_one    :category
  has_one    :play
  has_one    :hotel
  has_one    :meal

  validates :title, :travel_day, :traffic_way, :recommend_age, :evaluation, presence: true
  validates :title, length: {maximum: 87}

  enum traffic_way: {"車": 0,"電車": 1,"飛行機": 2,"バス": 3, "その他": 4}
end
