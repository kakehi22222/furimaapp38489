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

# テーブル設計

## users テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false               |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| first_name          | string  | null: false               |
| last_name           | string  | null: false               |
| first_name_kana     | string  | null: false               |
| last_name_kana      | string  | null: false               |
| birth_date          | date    | null: false               |


### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column         | Type       | Options                         |
| -------------- | ---------- | ------------------------------- |
| item_name      | string     | null: false                     |
| item_info      | text       | null: false                     |
| item_price     | integer    | null: false                     |
| category_id    | integer    | null: false                     |
| condition_id   | integer    | null: false                     |
| cost_burden_id | integer    | null: false                     |
| prefectures_id | integer    | null: false                     |
| aim_id         | integer    | null: false                     |
| user           | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :cost_burden
- belongs_to_active_hash :prefectures
- belongs_to_active_hash :aim


## shipping_addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefectures_id   | integer    | null: false                    |
| municipality     | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | text       |                                |
| phone_number     | string     | null: false                    |
| purchase         | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase


## purchases テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address
