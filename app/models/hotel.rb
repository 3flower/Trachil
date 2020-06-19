class Hotel < ApplicationRecord

  belongs_to :travel

  validates :hotel_name, :address, :adult_price, :child_price, :impression, presence: true
  validates :impression, length: {maximum: 1000}
  validates :parking, presence: true, if: :traffic_way?
  def traffic_way?
    self.travel.traffic_way == "車"
  end

  enum parking: {"あり": 0,"なし": 1,"近くにあり": 2,"わからない": 3}
end
