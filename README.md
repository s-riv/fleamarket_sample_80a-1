# README

## DB設計
### usersテーブル

|Column|Type|Options|
|:-----|:--:|------:|
|nickname|string|null:false|
|email|string|null:false|
|password|string|null:false|
|password_confirm|string|null:false|
|first_name|string|null:false|
|last_name|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|birthday|date||

### Association
* has_many :products, dependent:delete_all
* has_one :address,dependent:delete

## addessesテーブル

|Column|Type|Options|
|:-----|:--:|------:|
|user_id|reference|null:false, foreign_key:true|
|postal_code|string|null:false|
|prefecture_id|integer|null:false,foreign_key:true|
|municipality|string|null:false|
|block_number|string|null:false|
|apartment_name|string||

### Association
* belongs_to :user

### cardsテーブル
|Column|Type|Options|
|:-----|:--:|------:|
|user_id|integer|null:false, foreign_key:true|
|customer_id|string|null:false|
|card_id|string|null:false|

### Associtation
* belongs_to :user

### productsテーブル
|Column|Type|Options|
|:-----|:--:|------:|
|name|string|null:false|
|price|integer|null:false|
|send_price|integer|null:false|
|description|text|null:false|
|condition|integer|null:false|
|brand|string||
|status|int|null:false|
|ship_day|string|null:false|
|category_id|integer|null:false|

### Association
* has_many :images
* belongs_to :user
* belongs_to :category

### imagesテーブル
|Column|Type|Options|
|:-----|:--:|------:|
|image|string|null:false|
|product_id|reference|null:false, foreign_key:true|

### Associtation
* belongs_to :product

### categoriesテーブル
|Column|Type|Options|
|:-----|:--:|------:|
|name|string|null:false|
|ancestry|string|null: false|

### Association
* has_many :products
* has_ancestry

### contractsテーブル
|Column|Type|Options|
|:-----|:--:|------:|
|user_id|integer|null:false, foreign_key:true|
|ancestry|string|null: false, foreign_key:true|

### Association
* belongs_to :product
* belongs_to :user