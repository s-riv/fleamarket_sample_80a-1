# README

## アプリケーション概要
* フリーマーケット用のWebアプリです。５人のチームでアジャイル開発を行いました。
* 作成期間： 2020/8/4 〜 2020/8/26

## 機能一覧
- ユーザー登録、ログイン機能（ウィザード形式）
- 商品出品機能（画像や商品カテゴリを含めた複数項目の情報をDBへ登録）
- 商品購入機能（ユーザーが所持するクレジットカードを用いて商品の購入）
- クレジットカード登録機能（PayJp）

## 使用技術
### ■ 言語
#### バックエンド
* Ruby 2.6.5

#### フロントエンド
* jquery-rails 4.4.0

## ■ フレームワーク
* Ruby on Rails 6.0.3.2

## ■ データベース
* MySQL 5.6.47

## ■ インフラ
* AWS EC2
* AWS S3

### デプロイ
* Capistranoによる自動デプロイ

### ER図
![Fleamarket_sample_80a](https://user-images.githubusercontent.com/63842526/91152535-09de5680-e6fa-11ea-95e3-b4273edfb7ac.jpg)


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
|status|integer|null:false|
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
|product_id|integer|null: false, foreign_key:true|

### Association
* belongs_to :product
* belongs_to :user
