# テーブル設計

## usersテーブル

| column            |Type    |Option                    |
|------------------------------------------------------ |
| nickname          |string  |null:false                |
| email             |string  |null:false , unique: true |
| password          |string  |null:false                |
| family_name       |string  |null:false                |
| last_name         |string  |null:false                |
| family_name_kana  |string  |null:false                |
| last_name_kana    |string  |null:false                |
| birthday          |date    |null:false                  |

### Association

-has_many items
-has_many memorys

## items テーブル

| Column        | Type    | Options     |
| ------        | ------- | ----------- |
| name          | string  | null: false |
| introduce     | string  | null: false |
| category      | string  | null: false |
| status        | string  | null: false |
| shipping      | integer | null: false |
| send_address  | string  | null: false |
| day           | integer | null: false |
| price         | integer | null: false |

### Association

- belongs_to : user
- has_one    : memory
- has_many   : address

## memorys テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| bought_item   | references | null: false, foreign_key: true |
| sold_item     | references | null: false, foreign_key: true |

### Association

- has_many   : address
- belongs_to : item
- has_one    : address

## address テーブル

| Column          | Type    | Option       |
| ----------------| ------- | ------------ |
| post_number     | string  | null: false  |
| prefecture      | string  | null: false  |
| city            | string  | null: false  |
| city_number     | integer | null: false  |
| building        | string  | null: false  |
| phone_number    | string | null: false  |

### Association

- belongs_to : memory