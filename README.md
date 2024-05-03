# users table

| Column          | Type    | Options                   |
| ----------------| ------- | ------------------------- |
| nickname        | string  | null: false               |
| email           | string  | null: false, unique: true |
| password        | string  | null: false               |
| user name       | string  | null: false               |
| user name(kana) | string  | null: false               |
| date of birth   | date    | null: false               |

## Association

- has_many :items
- has_many :purchase records




# items table

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item name           | string     | null: false                    |
| category            | string     | null: false                    |
| price               | integer    | null: false                    |
| seller              | string     | null: false                    |
| item image          | text       | null: false                    |
| description         | text       | null: false                    |
| item condition      | string     | null: false                    |
| shipping fee burden | string     | null: false                    |
| shipping area       | string     | null: false                    |
| days until shipping | string     | null: false                    |
| user                | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- has_one :purchase record





# purchase records table

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| buyer     | string     | null: false                    |
| item name | string     | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item
- has_one :delivery address





# delivery address table

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal code     | string     | null: false                    |
| prefecture      | string     | null: false                    |
| city,ward,town  | string     | null: false                    |
| street address  | string     | null: false                    |
| building name   | string     |                                |
| phone number    | string     | null: false                    |
| purchase record | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase record