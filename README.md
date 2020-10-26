## usersテーブル

| Column                | Type       | Options                         |
| --------------------- | ---------- | ------------------------------- |
| family_name           | string     | null: false                     |
| first_name            | string     | null: false                     |
| family_name_kana      | string     | null: false                     |
| first_name_kana       | string     | null: false                     |
| email                 | string     | null: false                     |
| password              | string     | null: false                     |
| administrator_id      | int        |                                 |

### Association

-has_many :matters
-has_many :business_talk_records

## mattersテーブル

| Column                | Type       | Options                         |
| --------------------- | ---------- | ------------------------------- |
| user                  | references | null: false, foreign_key: true  |
| sales_staff           | references | null: false, foreign_key: true  |
| matter_name           | string     | null: false                     |
| matter_explain        | text       |                                 |
| product               | string     | null: false                     |
| sale_price            | int        |                                 |
| profit_price          | int        |                                 |
| sale_time             | date       |                                 |
| priority_id           | int        | null: false                     |
| reliability_id        | int        | null: false                     |
| progress_id           | int        | null: false                     |
| occasion              | string     | null: false                     |
| staff_in_charge       | string     | null: false                     |
| is_edited             | boolean    | null: false                     |

### Association

-belongs_to  :user
-has_many    :clients, through: matter_clients
-has_many    :business_talks_records
-belongs_to  :sales_staff

## business_talk_recordsテーブル

| Column                | Type       | Options                         |
| --------------------- | ---------- | ------------------------------- |
| user                  | references | null: false, foreign_key: true  |
| matter                | references | null: false, foreign_key: true  |
| business_talk_start   | datetime   | null: false                     |
| business_talk_end     | datetime   | null: false                     |
| business_talk_explain | text       | null: false                     |

### Association

-belongs_to  :user
-belongs_to  :matter

## sales_staffsテーブル

| Column                | Type       | Options                         |
| --------------------- | ---------- | ------------------------------- |
| sales_department      | string     | null: false                     |
| sales_staff           | string     | null: false                     |

### Association

-has_many    :matters

## matter_clientsテーブル

| Column                | Type       | Options                         |
| --------------------- | ---------- | ------------------------------- |
| matter_id             | int        | null: false, foreign_key: true  |
| client_id             | int        | null: false, foreign_key: true  |

### Association

-belongs_to  :matter
-belongs_to  :client

## clients

| Column                | Type       | Options                         |
| --------------------- | ---------- | ------------------------------- |
| company               | string     | null: false                     |
| department            | string     | null: false                     |
| name                  | string     | null: false                     |

### Association

-has_many    :matter_clients
-has_many    :matters, through: matter_clients