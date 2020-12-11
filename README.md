#テーブル設計

##users テーブル

| Column        | type   | Options     |
|---------------|--------|--------------
| nickname      | string | unique:true |
| email         | string | unique:true |
| password      | string | null: false |
| user_name     | string | null: false |
| user_birthday | date   | null: false |

## items テーブル

| Column      | C    | Options        |
|-------------------------------------|
| image       |         | null: false |
| item_name   | string  | null: false |
| explanation | text    | null: false |
| detail      | text    | null: false |
| price       | integer | null: false |

## buys テーブル

| Column        | Column  | Options      |
|----------------------------------------|
| credit_number | integer | null: false? |
| expiration    | integer | null: false? |
| security_code | integer | null: false? |
| able_to_buy   | boolean |              |

## addresses テーブル

| Column           | Column  | Options     |
|------------------------------------------|
| post_code        | integer | null: false |
| perfection       | string  | null: false |
| post_number      | integer | null: false |
| house_name       | integer |             |
| telephone_number | integer | null: false |