class Brand < ApplicationRecord
  # アソシエーション
  has_many :items
end
