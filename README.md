# users_table

| Column                    | Type    | Options                   |
| --------------------------| ------- | ------------------------- |
| nickname                  | string  | null: false               |
| email                     | string  | null: false, unique: true |
| encrypted_password        | string  | null: false               |
| password_confirmation     | string  | null: false               |
| user_name                 | string  | null: false               |
| user_name(kana)           | string  | null: false               |
| date_of_birth             | date    | null: false               |

## Association

- has_many :items
- has_many :purchase_records




# items_table

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| category            | string     |                                |
| price               | integer    | null: false                    |
| item_image          | text       | null: false                    |
| description         | text       | null: false                    |
| item_condition      | string     |                                |
| shipping_fee_payer  | string     |                                |
| prefecture          | string     |                                |
| days_to_ship        | integer    |                                |
| user                | references | null: false, foreign_key: true |

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
| prefecture      | string     | null: false                    |
| city_ward_town  | string     | null: false                    |
| street_address  | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |
| purchase_record | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record