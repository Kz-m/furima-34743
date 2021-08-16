# table design

## users table

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | text    | null: false |
| password           | text    | null: false |
| name               | string  | null: false |
| kana               | string  | null: false |
| date_of_birth      | integer | null: false |

### Association

- has_many :items
- has_many :ships


## items table

| Column      | Type        | Options       |
| ---------   | ----------- | ------------- |
| name        | string      | null: false   |
| description | text        | null: false   |
| category    | string      | null: false   |
| status      | string      | null: false   |
| price       | integer     | null: false   |
| user        | references  |               |

### Association

- belongs_to :user
- has_one :image
- has_one :ship


## images table

| Column      | Type        | Options       |
| ---------   | ----------- | ------------- |
| image       |             | ActiveStorage |
| item        | references  |               |

### Association

- belongs_to :item


## ships table

| Column       | Type        | Options     |
| ------------ | ----------- | ----------- |
| fee          | string      | null: false |
| ship_from    | string      | null: false |
| days         | string      | null: false |
| item         | references  |             |
| user         | references  |             |

### Association

- belongs_to :user
- belongs_to :item



