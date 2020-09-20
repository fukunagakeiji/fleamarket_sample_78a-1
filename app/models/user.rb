class User < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :contact_informations, dependent: :destroy
  has_many :creditcards, dependent: :destroy
  has_many :comments
end
