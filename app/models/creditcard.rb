class Creditcard < ApplicationRecord
  belongs_to :user

  # バリデーション
  validates :card_id, presence: true
  validates :customer_id, presence: true
  validates :user_id, uniqueness: true
end
