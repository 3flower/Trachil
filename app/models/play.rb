class Play < ApplicationRecord

  belongs_to :travel, dependent: :destroy

  validates :name, :address, :adult_price, :child_price, :impression, presence: true
  validates :impression, length: {maximum: 1000}
  validates :parking, presence: true, if: :traffic_way?
  def traffic_way?
    self.travel.traffic_way == "車"
  end

  enum parking: {"駐車場あり": 0,"駐車場なし": 1,"駐車場近くにあり": 2,"わからない": 3}
end
