# table design

## users table

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| family_name        | string  | null: false               |
| given_name         | string  | null: false               |
| family_name(kana)  | string  | null: false               |
| given_name(kana)   | string  | null: false               |
| date_of_birth      | date    | null: false               |

### Association

- has_many :items
- has_many :purchase_histories


## items table

| Column           | Type        | Options           |
| ---------------- | ----------- | ----------------- |
| name             | string      | null: false       |
| description      | text        | null: false       |
| category_id      | integer     | null: false       |
| status_id        | integer     | null: false       |
| shipping_fee_id  | integer     | null: false       |
| ship_from_id     | integer     | null: false       |
| shipping_day_id  | integer     | null: false       |
| price            | integer     | null: false       |
| user             | references  | foreign_key: true |

### Association

- belongs_to :user
- has_one :image
- has_many :purchase_histories


## images table

| Column    | Type        | Options           |
| --------- | ----------- | ----------------- |
| image     |             | ActiveStorage     |
| item      | references  | foreign_key: true |

### Association

- belongs_to :item


## purchase_histories table

| Column   | Type        | Options           |
| -------- | ----------- | ----------------- |
| user     | references  | foreign_key: true |
| item     | references  | foreign_key: true |
| ship     | references  | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :ship


## ships table

| Column            | Type        | Options                   |
| ----------------- | ----------- | ------------------------- |
| zipcode           | integer     | null: false               |
| state             | string      | null: false               |
| locality          | string      | null: false               |
| address           | text        | null: false               |
| building_name     | text        |                           |
| phone_number      | string      | null: false, unique: true |
| purchase_history  | references  | foreign_key: true         |

### Association

- has_one: purchase_history




