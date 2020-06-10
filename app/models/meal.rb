class Meal < ApplicationRecord

  has_one :travel, dependent: :destroy

  validates :shop_name, :address, :adult_price, :cihld_price, :impression, presence: true, if: :is_meal?
  def is_meal?
    self.travel.category.is_meal == true
  end
  validates :impression, length: {maximum: 1000}
  validates :is_baby_food_place, presence: true, if: :is_baby_food?
  def is_baby_food?
    self.is_baby_food == true
  end
  validates :parking, presence: true, if: :traffic_way?
  def traffic_way?
    self.travel.traffic_way == 0
  end

  enum parking: {"駐車場あり": 0,"駐車場なし": 1,"駐車場近くにあり": 2,"わからない": 3}
end
