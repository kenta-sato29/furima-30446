# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ---------------- --| ------ | ----------- |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| description_item    | text       | null: false |
| category_id         | integer    | null: false |
| item_name           | string     | null: false |
| status_id           | integer    | null: false |
| price               | integer    | null: false |
| charge _id          | integer    | null: false |
| shipment_source _id | integer    | null: false |
| days_id             | integer    | null: false |
| user                | references | null: false |


### Association

- belongs_to :user
- has_one :purchase


## purchaseテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post          | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| first_number  | string     | null: false                    |
| second_number | string     | null: false                    |
| building_name | string     |                                |
| tel           | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase
