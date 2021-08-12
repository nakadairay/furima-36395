# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders
- has_one :card

## items テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| product_name          | string     | null: false                    |
| price                 | integer    | null: false                    |
| description           | text       | null: false                    |
| category_id           | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |
| postage_id            | integer    | null: false                    |
| status_id             | integer    | null: false                    |
| shipment_id           | integer    | null: false                    |
| estimated_shipping_id | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| order         | references | null: false, foreign_key: true |
| postcode      | string     | null: false                    |
| shipment_id   | integer    | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |

### Association

- belongs_to :order

## cards テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| customer_token | string     | null: false,                   |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user