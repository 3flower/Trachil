class Play < ApplicationRecord

  belongs_to :travel

  validates :name, :address, :adult_price, :child_price, :impression, presence: true, if: :is_play?
  def is_play?
    self.travel.category.is_play == true
  end
  validates :impression, length: {maximum: 1000}
  validates :adult_price, :child_price, numericality: true
  # validates :official_site, format: /\A{URI::regexp(%w(http https))}\z/
  validates :is_diaper_place, inclusion: {in: [true, false]}
  validates :parking, presence: true, if: :traffic_way?
  def traffic_way?
    if self.travel.category.is_play == true
      self.travel.traffic_way == "車"
    end
  end

  enum parking: {"あり": 0,"なし": 1,"近くにあり": 2,"わからない": 3}
end
