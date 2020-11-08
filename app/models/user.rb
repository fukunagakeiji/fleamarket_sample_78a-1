class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  has_one :contact_information
  has_many :items, dependent: :destroy
  has_many :contact_informations, dependent: :destroy
  has_one :creditcard, dependent: :destroy
  has_many :comments
  # seller_id(出品者)はいるが、まだ、buyer_id(買取者)またはauction_id(取引者)はいないitemのレコード
  has_many :saling_items, -> { where("seller_id is not NULL && buyer_id is NULL") }, class_name: "Item"
  # seller_id(出品者)とbuyer_id(買取者)は存在するが、auction_id(取引者)は存在していないitemレコード
  has_many :sold_items, -> { where("seller_id is not NULL && buyer_id is not NULL && auction_id is NULL") }, class_name: "Item"
  # seller_id(出品者)とauction_id(取引者)のユーザーが存在し、buyer_id(買取者)はまだ存在していないitemレコード
  has_many :auction_items, -> { where("seller_id is not NULL && auction_id is not NULL && buyer_id is NULL") }, class_name: "Item"
end
