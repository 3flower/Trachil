class Hotel < ApplicationRecord

  has_many :travel, dependent: :destroy

  validates :hotel_name, :address, :adult_price, :cild_price, :impression, presence: true
  validates :impression, length: {maximum: 1000}
  validates :parking, presence: true, if: :traffic_way?
  def traffic_way?
    self.traffic_way == 0
  end

  enum parking: {"駐車場あり": 0,"駐車場なし": 1,"駐車場近くにあり": 2,"わからない": 3}
end
