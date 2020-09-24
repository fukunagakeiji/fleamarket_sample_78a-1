class Image < ApplicationRecord
  # アソシエーション
  belongs_to :item

  mount_uploader :image, ImageUploader

  # バリデーション
  validates :image, presence: true
end
