# users_table

| Column                    | Type    | Options                   |
| --------------------------| ------- | ------------------------- |
| nickname                  | string  | null: false               |
| email                     | string  | null: false, unique: true |
| encrypted_password        | string  | null: false               |
| last_name                 | string  | null: false               |
| first_name                | string  | null: false               |
| last_name_kana            | string  | null: false               |
| first_name_kana           | string  | null: false               |
| date_of_birth             | date    | null: false               |

## Association

- has_many :items
- has_many :purchase_records




# items_table

| Column                | Type       | Options                        |
| ----------------------| ---------- | ------------------------------ |
| item_name             | string     | null: false                    |
| price                 | integer    | null: false                    |
| description           | text       | null: false                    |
| category_id           | integer    | null: false                    |
| item_condition_id     | integer    | null: false                    |
| shipping_fee_payer_id | integer    | null: false                    |
| prefecture_id         | integer    | null: false                    |
| days_to_ship_id       | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- has_one :purchase_record





# purchase_records_table

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item
- has_one :delivery_address





# delivery_addresses_table

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city_ward_town  | string     | null: false                    |
| street_address  | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |
| purchase_record | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record