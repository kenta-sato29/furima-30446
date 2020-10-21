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
- has_many :purchase

## items テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| description_item | text       | null: false |
| category         | integer    | null: false |
| item_name        | string     | null: false |
| status           | integer    | null: false |
| price            | integer    | null: false |
| charge           | integer    | null: false |
| shipment_source  | integer    | null: false |
| days             | integer    | null: false |
| user             | references | null: false |


### Association

- belongs_to :user
- has_one :purchase


## purchaseテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| items    | references | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user
- belongs_to :users
- has_one :address

## address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post          | string     | null: false                    |
| prefecture    | integer    | null: false, foreign_key: true |
| first_number  | string     | null: false                    |
| second_number | string     | null: false                    |
| building_name | string     | null: false                    |
| tel           | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase
