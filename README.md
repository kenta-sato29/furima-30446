# README

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| nickname | string | null: false |
| birthday | string | null: false |

### Association

- has_many :items_exhibit
- has_many :items_comment
- belongs_to :address


## items テーブル

| Column  | Type   | Options     |
| ------- | ------ | ----------- |
| exhibit | string | null: false |
| details | string | null: false |
| comment | text   | 

### Association

- has_one :purchase


## purchaseテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :items

## address テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| destination | references | null: false, foreign_key: true |

### Association

- has_one :users