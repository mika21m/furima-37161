# テーブル設計

## users テーブル

| Column                   | Type       | Options                      |
| ------------------------ | ---------- | ---------------------------- |
| nickname                 | string     | null: false,                 |
| email                    | string     | null: false, unique: true    |
| encrypted_password       | string     | null: false                  |
| last_name                | string     | null: false                  |
| first_name               | string     | null: false                  |
| last_name_kana           | string     | null: false                  |
| first_name_kana          | string     | null: false                  |
| birthday                 | date       | null: false                  |

### Association

- has_many :items, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :purchase_records
- has_one :card

## items テーブル

| Column                   | Type       | Options                       |
| ------------------------ | ---------- | ----------------------------- |
| name                     | string     | null: false                   |
| description              | text       | null: false                   |
| category_id              | integer    | null: false                   |
| status_id                | integer    | null: false                   |
| shipping_cost_id         | integer    | null: false                   |
| shipping_prefecture_id   | integer    | null: false                   |
| shipping_day_id          | integer    | null: false                   |
| price                    | integer    | null: false                   |
| user                     | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments
- has_one :purchase_record

## destinations テーブル

| Column                   | Type       | Options                       |
| ------------------------ | ---------- | ----------------------------- |
| postal_code              | string     | null: false                   |
| prefecture_id            | integer    | null: false                   |
| city                     | string     | null: false                   |
| address                  | string     | null: false                   |
| building_name            | string     |                               |
| phone_number             | integer    | null: false                   |
| purchase_record          | references | null: false,foreign_key: true |

### Association

- belongs_to :purchase_record

## purchase_records テーブル

| Column                   | Type       | Options                       |
| ------------------------ | ---------- | ----------------------------- |
| user                     | references | null: false,foreign_key: true |
| item                     | references | null: false,foreign_key: true |

### Association

- has_one :destination
- belongs_to :item
- belongs_to :user

## commentsテーブル

| Column                   | Type       | Options                       |
| ------------------------ | ---------- | ----------------------------- |
| text                     | text       | null: false                   |
| user                     | references | null: false,foreign_key: true |
| item                     | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## cardsテーブル

| Column                   | Type       | Options                       |
| ------------------------ | ---------- | ----------------------------- |
| card_token               | string     | null: false                   |
| user_id                  | integer    | null: false                   |
| customer_token           | string     | null: false                   |

### Association

- belongs_to :user