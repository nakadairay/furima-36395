# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| product_name       | string     | null: false                    |
| price              | integer    | null: false                    |
| description        | text       | null: false                    |
| category           | string     | null: false                    |
| user               | references | null: false, foreign_key: true |
| postage            | text       | null: false                    |
| status             | text       | null: false                    |
| shipment           | text       | null: false                    |
| estimated_shipping | text       | null: false                    |

### Association

- has_one :order

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| postcode      | string | null: false |
| prefecture_id | string | null: false |
| city          | string | null: false |
| block         | string | null: false |
| building      | string |             |
| phone_number  | string | null: false |

### Association

- belongs_to :order