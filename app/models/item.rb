class Item < ApplicationRecord
  # アソシエーション
  belongs_to :user, dependent: :destroy
  has_many :images, dependent: :destroy
  # fields_forメソッドを利用する際に、親モデルの中に書く必要があるメソッド
  # allow_destroy: trueメソッド（accepts_nested_attributes_forメソッドのオプションとして、引数に書くことができる記述です。このオプションをつけることで、親のレコードが削除された場合に、関連付いている子のレコードも一緒に削除してくれます。）
  accepts_nested_attributes_for :images, allow_destroy: true
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
