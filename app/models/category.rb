class Category < ApplicationRecord
  # アソシエーション
  has_many :items
  has_ancestry

  # バリデーション
  validates :name, presence: true
end
