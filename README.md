#テーブル設計

## users テーブル

| Column              | type       | Options     |
|---------------------|------------|-------------|
| nickname            | string     | null: false |
| email               | string     | unique:true |
| encrypted_password  | string     | null: false |
| first_name          | string     | null: false |
| last_name           | string     | null: false |
| first_name_katakana | string     | null: false |
| last_name_katakana  | string     | null: false |
| birthday            | date       | null: false |


### Association
has_many :items :buys


## items テーブル

| Column           | type       | Options           |
|------------------|------------|-------------------|
|  image           |            |                   |
|  item_name       | string     | null: false       |
| explanation      | text       | null: false       |
| category_id      | integer    | null:false        |
| status_id        | integer    | null: false       |
| delivery_fee_id  | integer    | null:false        |
| shipping_area_id | integer    | null:false        |
| days_to_ship_id  | integer    | null:false        |
| price            | integer    | null: false       |
| user             | references | foreign_key: true |

### Association
has_one :buy
belongs_to :user


## order テーブル

| Column        | Column    | Options             |
|---------------|-----------|---------------------|
| user          | reference | foreign_key :true |
| item          | reference | foreign_key :true |

### Association
belongs_to :item
belongs_to :user
has_one :address

## addresses テーブル

| Column           | Column     | Options           |
|------------------|------------|-------------------|
| post_number      | string     | null: false       |
| prefecture_id    | integer    | null: false       |
| city             | string     | mull: false       |
| house_number     | string     | null: false       |
| building_name    | string     |                   |
| telephone_number | string     | null: false       |
| buys             | references | foreign_key :true |

### Association
belongs_to :buy








