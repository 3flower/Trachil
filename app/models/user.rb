class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :travels, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_travels, through: :likes, source: :travel
  # フォロー機能
  has_many :relationships, :dependent => :destroy
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "follow_id"
  has_many :followers, through: :reverse_of_relationships, source: :user
  # ユーザーをフォローする
  def follow(other_user)
    if self != other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end
  # ユーザーのフォローを外す
  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end
  # フォロー確認をおこなう
  def following?(other_user)
    self.followings.include?(other_user)
  end

  #
  mount_uploader :user_image_id, UserImageIdUploader

  validates :name, presence: true
  validates :introduction, length: {maximum: 250}
  # validates :child_people, :child_age, numericality: true
  validates :is_child,  inclusion: {in: [true, false]}
  validates :child_people, :child_age, presence: true, if: :is_child?
  validates :is_diaper, :is_baby_food,  inclusion: {in: [true, false]}, if: :is_child?
  def is_child?
    self.is_child == true
  end

  # 退会機能
  def active_for_authentication?
    super && (self.is_valid == false)
  end

end
