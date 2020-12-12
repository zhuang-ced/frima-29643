#テーブル設計

## users テーブル

| Column        | type   | Options     |
|---------------|--------|--------------
| nickname      | string | unique:true |
| email         | string | unique:true |
| password      | string | null: false |
| user_name     | string | null: false |
| user_birthday | date   | null: false |

### Association
has_many :items :buys


## items テーブル

| Column      | type    | Options           |
|-------------------------------------------|
| image       | string  | null: false       |
| item_name   | string  | null: false       |
| explanation | text    | null: false       |
| detail      | text    | null: false       |
| price       | integer | null: false       |
| able_to_buy | boolean | foreign_key: true |
| seller      | string  | null: false       |

### Association
has_one :buy
belongs_to :user


## buys テーブル

| Column        | Column  | Options           |
|---------------------------------------------|
| buyer         | integer | null: false       |
| item          | string  | null: false       |
| able_to_buy   | boolean | foreign_key: true |

### Association
has_one :item
belongs_to :users

## addresses テーブル

| Column           | Column  | Options     |
|------------------------------------------|
| post_code        | integer | null: false |
| perfection       | string  | null: false |
| post_number      | integer | null: false |
| house_name       | integer | null: false |
| telephone_number | integer | null: false |

### Association
has_one :buy