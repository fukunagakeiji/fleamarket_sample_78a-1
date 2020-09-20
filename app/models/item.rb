class Item < ApplicationRecord
  # アソシエーション
  belongs_to :user, dependent: :destroy
  has_many :images, dependent: :destroy
  belongs_to :category, dependent: :destroy
  belongs_to :brand, dependent: :destroy
  has_many :comments, dependent: :destroy

  # バリデーション
  validates :name, presence: true
  validates :explain, presence: true
  validates :status, presence: true
  validates :delivery_fee, presence: true
  validates :region, presence: true
  validates :days, presence: true
  validates :price, presence: true
end
