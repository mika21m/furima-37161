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
| birthday                 | integer    | null: false                  |

### Association

- has_many :items, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :destinations

## items テーブル

| Column                   | Type       | Options                       |
| ------------------------ | ---------- | ----------------------------- |
| name                     | string     | null: false                   |
| description              | text       | null: false                   |
| category_id              | integer    | null: false                   |
| status_id                | integer    | null: false                   |
| shipping_cost_id         | integer    | null: false                   |
| shipping_prefecture_id   | integer    | null: false                   |
| shipping_days_id         | integer    | null: false                   |
| price                    | integer    | null: false                   |
| user                     | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments
- belongs_to :destination
- has_one_attached :image
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :shipping_cost
- belongs_to_active_hash :shipping_prefecture
- belongs_to_active_hash :shipping_days

## destinations テーブル

| Column                   | Type       | Options                       |
| ------------------------ | ---------- | ----------------------------- |
| postal_code              | string     | null: false                   |
| prefecture_id            | integer    | null: false                   |
| city                     | string     | null: false                   |
| address                  | string     | null: false                   |
| building_name            | string     | null: false                   |
| phone_number             | integer    | null: false                   |
| user                     | references | null: false,foreign_key: true |
| item                     | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- has_many :items
- has_one :card
- belongs_to_active_hash :prefecture

## imagesテーブル

| Column                   | Type       | Options                       |
| ------------------------ | ---------- | ----------------------------- |
| image                    |            | null: false                   |
| item                     | references | null: false,foreign_key: true |

### Association

- belongs_to :item

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
| card_id                  | string     | null: false                   |
| user_id                  | integer    | null: false                   |
| customer_id              | string     | null: false                   |

### Association

- belongs_to :destination