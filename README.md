# テーブル設計

## users テーブル

| Column                  | Type   | Options     |
| ----------------------- | ------ | ----------- |
| name                    | string | null: false |
| email                   | string | null: false |
| password                | string | null: false |
| password_confirmation   | string | null: false |
| last_name               | string | null: false |
| first_name              | string | null: false |
| last_name_kana          | string | null: false |
| first_name_kana         | string | null: false |
| birthday                | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                  | Type       | Options                        |
| ----------------------- | -----------| ------------------------------ |
| user_id                 | references | null: false, foreign_key: true |
| image                   | text       | null: false, foreign_key: true |
| name                    | string     | null: false, foreign_key: true |
| info                    | text       | null: false, foreign_key: true |
| category                | string     | null: false, foreign_key: true |
| status                  | string     | null: false, foreign_key: true |
| shipping_fee            | string     | null: false, foreign_key: true |
| item_prefecture         | string     | null: false, foreign_key: true |
| scheduled_delivery      | string     | null: false, foreign_key: true |
| price                   | integer    | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column                  | Type       | Options                        |
| ----------------------- | -----------| ------------------------------ |
| user_id                 | references | null: false, foreign_key: true |
| item_id                 | references | null: false, foreign_key: true |
| postal_code             | string     | null: false, foreign_key: true |
| prefecture              | text       | null: false, foreign_key: true |
| city                    | string     | null: false, foreign_key: true |
| addresses               | string     | null: false, foreign_key: true |
| building                | string     | null: false, foreign_key: true |
| phone_number            | string     | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item