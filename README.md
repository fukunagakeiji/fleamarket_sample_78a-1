# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true|
|password|strimg|null: false, unique: true|
|icon|string|
|introduction|text|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|

### Association
- has_many :items dependent: :destroy
- has_many :contact_informations dependent: :destroy
- has_many :creditcards dependent: :destroy
- has_many :Comments 


## creditcardテーブル

|Column|Type|Options|
|------|----|-------|
|card_id|string|null: false|
|customer_id|string|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user


## contact_informationテーブル

Column|Type|Options|
|------|----|-------|
|destination_family_name|string|null: false|
|destination_first_name|string|null: false|
|destination_family_name_kana|string|null: false|
|destination_first_name_kana|string|null: false|
|post_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|
|phone_number|string|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to: user


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|explain|text|null: false|
|status|string|null: false|
|delivery_fee|string|null: false|
|region|string|null: false|
|days|string|null: false|
|price|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user dependent: :destroy
- has_many :images dependent: :destroy
- belongs_to :category dependent: :destroy
- belongs_to :brand dependent: :destroy
- has_many :comments dependent: :destroy


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item


## categoryテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|

### Association
- has_many :items


## brandテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- has_many :items


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|string|
|item_id|integer|foreign_key: true|
|user_id|integer|foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user
