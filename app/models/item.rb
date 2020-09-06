class Item < ApplicationRecord
  has_many :images
  belongs_to :category
  belongs_to :brand
end
