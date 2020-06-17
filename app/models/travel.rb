class Travel < ApplicationRecord

  has_many   :travel_images, dependent: :destroy
  has_many   :comments, dependent: :destroy
  has_many   :likes, dependent: :destroy
  has_many   :liked_travels, through: :likes, source: :travel
  belongs_to :user
  has_one    :category, dependent: :destroy
  has_one    :play, dependent: :destroy
  has_one    :hotel, dependent: :destroy
  has_one    :meal, dependent: :destroy

  validates :title, :travel_day, :traffic_way, :recommend_age, :evaluation, presence: true
  validates :title, length: {maximum: 87}

  enum traffic_way: {"車": 0,"電車": 1,"飛行機": 2,"バス": 3, "その他": 4}

  def liked_by?(user)
		self.likes.where(user_id: user.id).exists?
	end
end
