class Meal < ApplicationRecord

  has_many :travel, dependent: :destroy

  validates :shop_name, :address, :adult_price, :cild_price, :impression, presence: true
  validates :impression, length: {maximum: 1000}
  validates :is_baby_food_place, presence: true, if: :is_baby_food?
  def is_baby_food?
    self.is_baby_food == true
  end
end
