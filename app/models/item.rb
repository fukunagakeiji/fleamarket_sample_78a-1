class Item < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :images, dependent: :destroy
  belongs_to :category, dependent: :destroy
  belongs_to :brand, dependent: :destroy
  has_many :comments, dependent: :destroy
end
