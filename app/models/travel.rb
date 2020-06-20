class Travel < ApplicationRecord

  has_many   :travel_images, dependent: :destroy
  has_many   :comments, dependent: :destroy
  has_many   :likes, dependent: :destroy
  has_many   :liked_users, through: :likes, source: :user
  belongs_to :user
  has_one    :category, dependent: :destroy
  has_one    :play, dependent: :destroy
  has_one    :hotel, dependent: :destroy
  has_one    :meal, dependent: :destroy
  accepts_nested_attributes_for :category
  accepts_nested_attributes_for :play
  accepts_nested_attributes_for :hotel
  accepts_nested_attributes_for :meal
  accepts_nested_attributes_for :travel_images

  validates :title, :travel_day, :traffic_way, :recommend_age, :evaluation, presence: true
  validates :title, length: {maximum: 87}

  enum traffic_way: {"車": 0,"電車": 1,"飛行機": 2,"バス": 3, "その他": 4}

  def liked_by?(user)
		self.likes.where(user_id: user.id).exists?
	end
end
