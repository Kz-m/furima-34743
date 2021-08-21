# table design

## users table

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | text    | null: false               |
| family_name        | string  | null: false               |
| given_name         | string  | null: false               |
| family_name(kana)  | string  | null: false               |
| given_name(kana)   | string  | null: false               |
| date_of_birth      | date    | null: false               |

### Association

- has_many :items
- has_many :ships
- has_many :purchase_histories


## items table

| Column        | Type        | Options       |
| ------------- | ----------- | ------------- |
| name          | string      | null: false   |
| description   | text        | null: false   |
| category      | string      | null: false   |
| status        | string      | null: false   |
| shipping_fee  | text        | null: false   |
| ship_from     | string      | null: false   |
| shipping_days | string      | null: false   |
| price         | integer     | null: false   |
| user          | references  |               |

### Association

- belongs_to :user
- has_one :image
- has_one :ship
- has_many :purchases_histories


## images table

| Column      | Type        | Options       |
| ---------   | ----------- | ------------- |
| image       |             | ActiveStorage |
| item        | references  |               |

### Association

- belongs_to :item


## purchase_histories table

| Column      | Type        | Options       |
| ----------- | ----------- | ------------- |
| user        | references  |               |
| item        | references  |               |

### Association

- belongs_to :user
- belongs_to :item


## ships table

| Column              | Type        | Options                                   |
| ------------------- | ----------- | ----------------------------------------- |
| zipcode             | integer     | null: false, postal_code, presence: true  |
| state               | string      | null: false                               |
| locality            | string      | null: false                               |
| address             | text        | null: false                               |
| building_name       | text        |                                           |
| phone_number        | integer     | null: false, phone_number, presence: true |
| credit_card_num     | integer     | null: false                               |
| expiration_date     | integer     | null: false                               |
| security_code       | integer     | null: false                               |
| purchase_history_id | references  |                                           |
| item                | references  |                                           |
| user                | references  |                                           |

### Association

- belongs_to :user
- belongs_to :item




