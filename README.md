# table design

## users table

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| family_name        | string  | null: false               |
| given_name         | string  | null: false               |
| family_name_kana   | string  | null: false               |
| given_name_kana    | string  | null: false               |
| date_of_birth      | date    | null: false               |

### Association

- has_many :items
- has_many :purchase_histories


## items table

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| name             | string      | null: false                    |
| description      | text        | null: false                    |
| price            | integer     | null: false                    |
| category_id      | integer     | null: false                    |
| status_id        | integer     | null: false                    |
| shipping_fee_id  | integer     | null: false                    |
| shipping_day_id  | integer     | null: false                    |
| prefecture_id    | integer     | null: false                    |
| user             | references  | foreign_key: true, null: false |

### Association

- belongs_to :user
- has_one :purchase_history
- belongs_to :category
- belongs_to :status
- belongs_to :shipping_fee
- belongs_to :shipping_day
- belongs_to :prefecture


## purchase_histories table

| Column   | Type        | Options                        |
| -------- | ----------- | ------------------------------ |
| user     | references  | foreign_key: true, null: false |
| item     | references  | foreign_key: true, null: false |

### Association

- belongs_to :user
- belongs_to :item
- has_one :ship


## ships table

| Column            | Type        | Options                   |
| ----------------- | ----------- | ------------------------- |
| zipcode           | string      | null: false               |
| state_id          | integer     | null: false               |
| locality          | string      | null: false               |
| address           | string      | null: false               |
| building_name     | string      |                           |
| phone_number      | string      | null: false, unique: true |
| purchase_history  | references  | foreign_key: true         |

### Association

- belongs_to: purchase_history




