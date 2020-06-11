class Travel < ApplicationRecord

  has_many   :travel_images, dependent: :destroy
  belongs_to :user
  belongs_to :category
  belongs_to :play
  belongs_to :hotel
  belongs_to :meal

  enum traffic_way: {"車": 0,"電車": 1,"飛行機": 2,"バス": 3, "その他": 4}
end
