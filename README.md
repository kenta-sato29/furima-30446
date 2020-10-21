# README

# テーブル設計

## users テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| family name | string | null: false |
| first name  | string | null: false |
| huragana    | string | null: false |
| kana        | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| nickname    | string | null: false |
| birthday    | date   | null: false |

### Association

- belongs_to :address
- has_many :items


## items テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| exhibit  | string | null: false |
| details  | string | null: false |
| image    |        |             |
| category | string | null: false |
| name     | string | null: false |
| status   | string | null: false |
| price    | string | null: false |
| charge   | string | null: false |

### Association

- has_one :purchase


## purchaseテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| number   | date       | null: false, foreign_key: true |
| limit    | date       | null: false, foreign_key: true |
| security | date       | null: false, foreign_key: true |


### Association

- belongs_to :items

## address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post          | date       | null: false, foreign_key: true |
| Prefectures   | date       | null: false, foreign_key: true |
| first number  | date       | null: false, foreign_key: true |
| second number | date       | null: false, foreign_key: true |
| tel           | date       | null: false, foreign_key: true |




### Association

- has_one :users