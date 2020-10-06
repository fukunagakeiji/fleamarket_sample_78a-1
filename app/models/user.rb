class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday, presence: true
  #validates :email, :password, presence: true, uniqueness: true
  has_one :contact_information
  has_many :items, dependent: :destroy
  has_many :contact_informations, dependent: :destroy
  has_many :creditcards, dependent: :destroy
  has_many :comments
end
