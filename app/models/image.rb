class Image < ApplicationRecord
  # アソシエーション
  belongs_to :item, optional: true, foreign_key: :image_id

  mount_uploader :image, ImageUploader

  # バリデーション
  validates :image, presence: true
end
