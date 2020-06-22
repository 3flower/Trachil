class Meal < ApplicationRecord

  belongs_to :travel

  validates :shop_name, :address, :adult_price, :child_price, :impression, presence: true, if: :is_meal?
  def is_meal?
    self.travel.category.is_meal == true
  end
  validates :impression, length: {maximum: 1000}
  validates :adult_price, :child_price, numericality: true
  validates :parking, presence: true, if: :traffic_way?
  validates :is_baby_food_place, inclusion: {in: [true, false]}
  # validates :official_site, format: /\A{URI::regexp(%w(http https))}\z/
  def traffic_way?
    if self.travel.category.is_meal == true
      self.travel.traffic_way == "車"
    end
  end

  enum parking: {"あり": 0,"なし": 1,"近くにあり": 2,"わからない": 3}
end
