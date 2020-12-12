#テーブル設計

## users テーブル

| Column             | type       | Options             |
|--------------------|------------|---------------------|
| nickname           | string     | unique:true         |
| email              | string     | unique:true         |
| encrypted_password | references | reference: true     |
| first_name         | string     | null: false         |
| last_name          | string     | null: false         |
| user_birthday      | date       | null: false         |

### Association
has_many :items :buys


## items テーブル

| Column      | type       | Options           |
|-------------|------------|-------------------|
| item_name   | string     | null: false       |
| explanation | text       | null: false       |
| detail      | text       | null: false       |
| price       | integer    | null: false       |
| user        | references | foreign_key: true |

### Association
has_one :buy
belongs_to :user


## buys テーブル

| Column        | Column  | Options           |
|---------------|---------|-------------------|
| buyer         | integer | null: false       |
| item          | string  | null: false       |

### Association
belongs_to :item
belongs_to :user
has_one :address

## addresses テーブル

| Column           | Column     | Options           |
|------------------|------------|-------------------|
| integer          | genre_id   | null: false       |
| perfection       | string     | null: false       |
| post_number      | string     | null: false       |
| house_number     | string     | null: false       |
| telephone_number | string     | null: false       |
| building_name    | string     |                   |
| buyer            | references | foreign_key :true |

### Association
belongs_to :buy