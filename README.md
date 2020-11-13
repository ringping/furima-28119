# テーブル設計

## usersテーブル

| column            |Type    |Option                    |
|------------------------------------------------------ |
| nickname          |string  |null:false                |
| mail              |string  |null:false , unique: true |
| password          |string  |null:false                |
| family_name       |string  |null:false                |
| last_name         |string  |null:false                |
| family_name_kana  |string  |null:false                |
| last_name_kana    |string  |null:false                |
| birthday          |string  |null:false                |

### Association

-has_many items
-has_many memory

## items テーブル

| Column        | Type    | Options     |
| ------        | ------- | ----------- |
| item_name     | string  | null: false |
| introduce     | string  | null: false |
| category      | string  | null: false |
| status        | string  | null: false |
| shipping      | integer | null: false |
| send_address  | string  | null: false |
| day           | integer | null: false |
| price         | integer | null: false |

### Association

- belongs_to : users
- has_one    : memories
- has_many   : address

## memories テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| bought_item   | references | null: false, foreign_key: true |
| sold_item     | references | null: false, foreign_key: true |

### Association

- has_many   : address
- belongs_to : items
- has_one    : address

## address テーブル

| Column          | Type    | Option       |
| ----------------| ------- | ------------ |
| post_number     | integer | null: false  |
| prefecture      | string  | null: false  |
| city            | string  | null: false  |
| city_number     | integer | null: false  |
| building        | string  | null: false  |
| phone_number    | integer | null: false  |

### Association

- belongs_to : memories
- belongs_to : users