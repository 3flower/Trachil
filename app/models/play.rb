class Play < ApplicationRecord

  has_one :travel, dependent: :destroy

  validates :name, :address, :adult_price, :child_price, :impression, presence: true, if: :is_paly?
  def is_paly?
    self.travel.category.is_paly == true
  end
  validates :impression, length: {maximum: 1000}
  validates :is_diaper_place, presence: true, if: :is_diaper?
  def is_diaper?
    self.travel.user.is_diaper == true
  end
  validates :parking, presence: true, if: :traffic_way?
  def traffic_way?
    self.travel.traffic_way == 0
  end

  enum parking: {"駐車場あり": 0,"駐車場なし": 1,"駐車場近くにあり": 2,"わからない": 3}
end
