class Item < ApplicationRecord
  # アソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :deliveryfee
  belongs_to_active_hash :shippingdays
  belongs_to :user, dependent: :destroy
  has_many :images, dependent: :destroy
  belongs_to :category, dependent: :destroy
  has_one :brand, dependent: :destroy
  has_many :comments, dependent: :destroy
  # fields_forメソッドを利用する際に、親モデルの中に書く必要があるメソッド(field_forメソッドはアソシエーションで紐づいているモデルを1つのフォームで入力・更新できる)
  # allow_destroy: trueメソッド（accepts_nested_attributes_forメソッドのオプションとして、引数に書くことができる記述です。このオプションをつけることで、親のレコードが削除された場合に、関連付いている子のレコードも一緒に削除してくれる。）
  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :brand, allow_destroy: true

  # バリデーション
  validates :name, presence: true
  validates :explain, presence: true
  validates :status, presence: true
  validates :delivery_fee, presence: true
  validates :region, presence: true
  validates :days, presence: true
  validates :price, presence: true
end
