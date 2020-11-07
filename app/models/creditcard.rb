class Creditcard < ApplicationRecord
  belongs_to :user

  # バリデーション
  validates :card_id, null: false
  validates :customer_id, null: false
  validates :user_id, uniqueness: true
end
