class Category < ApplicationRecord

  has_many :travel, dependent: :destroy
end
