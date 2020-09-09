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
|familyname|string|null: false|
|firstname|string|null: false|
|familyname_kana|string|null: false|
|firstname_kana|string|null: false|
|birthday_year|date|null: false|
|birthday_month|date|null: false|
|birthday_day|date|null: false|

### Association
- has_many :items dependent: :destroy
- belongs_to :contact_information dependent: :destroy
- belongs_to :creditcard dependent: :destroy


## creditcardテーブル

|Column|Type|Options|
|------|----|-------|
|card_number|string|null: false|
|effective_date_month|string|null: false|
|effective_date_year|string|null: false|
|security_card|string|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user


## contact_informationテーブル

Column|Type|Options|
|------|----|-------|
|destination_familyname|string|null: false|
|destination_firstname|string|null: false|
|destination_familyname_kana|string|null: false|
|destination_firstname_kana|string|null: false|
|post_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|housenumber|string|null: false|
|building_name|string|
|phonenumber|string|
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
|image_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user dependent: :destroy
- has_many :images dependent: :destroy
- belongs_to :category dependent: :destroy
- belongs_to :brand dependent: :destroy
- 


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
|item_id|integer|null: false, foreign_key: true|

### Association
- has_many :items


## brandテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|
|item_id|integer|foreign_key: true|

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
