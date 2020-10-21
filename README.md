# README

# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| nickname         | string | null: false |
| birthday         | date   | null: false |

### Association

- has_many :items


## items テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| exhibit          | string  | null: false |
| Description_item | text    | null: false |
| category         | string  | null: false |
| item_name        | string  | null: false |
| status           | string  | null: false |
| price            | integer | null: false |
| charge           | string  | null: false |

### Association

- belongs_to :user
- has_one :purchase


## purchaseテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |


### Association

- belongs_to :item, :user
- has_one :users
- has_one :address

## address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post          | string     | null: false, foreign_key: true |
| Prefecture    | integer    | null: false, foreign_key: true |
| first_number  | string     | null: false, foreign_key: true |
| second_number | string     | null: false, foreign_key: true |
| tel           | string     | null: false, foreign_key: true |


### Association

- has_one :users
- belongs_to :purchase
