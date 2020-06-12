class Category < ApplicationRecord

  belongs_to  :travel, dependent: :destroy
end
