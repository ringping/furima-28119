# テーブル設計

## usersテーブル

| column            |Type    |Option                     |
|------------------------------------------------------- |
| nickname          |string  |null: false                |
| email             |string  |null: false , unique: true |
| encrypted_password|string  |null: false                |
| family_name       |string  |null: false                |
| last_name         |string  |null: false                |
| family_name_kana  |string  |null: false                |
| last_name_kana    |string  |null: false                |
| birthday          |date    |null: false                |

### Association

-has_many items
-has_many memorys

## items テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| name            | string  | null: false |
| introduce       | text    | null: false |
| category_id     | string  | null: false |
| status_id       | string  | null: false |
| shipping_id     | integer | null: false |
| send_address_id | string  | null: false |
| day_id          | integer | null: false |
| price           | integer | null: false |

### Association

- belongs_to : user
- has_one    : memory

## memorys テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| bought_item   | references | null: false, foreign_key: true |
| bought_user   | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to : item
- has_one    : address

## address テーブル

| Column          | Type    | Option       |
| ----------------| ------- | ------------ |
| post_number     | string  | null: false  |
| prefecture      | string  | null: false  |
| city            | string  | null: false  |
| city_number     | string  | null: false  |
| building        | string  | null: false  |
| phone_number    | string  | null: false  |

### Association

- belongs_to : memory