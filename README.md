# テーブル設計

## usersテーブル

| Column                    | Type   | Options     | 
| ------------------------- | ------ | ----------- | 
| nickname                  | string | null: false | 
| email                     | string | null: false | 
| encrypted_password        | string | null: false | 
| last_name                 | string | null: false | 
| first_name                | string | null: false | 
| last_name_kana            | string | null: false | 
| first_name_kana           | string | null: false | 
| birth_date                | date   | null: false | 

### Association
- has_many :items
- has_many :purchases

## itemsテーブル

| Column                 | Type                       | Options                    | 
| ---------------------- | -------------------------- | -------------------------- | 
| price                  | integer                    | null: false                | 
| name                   | string                     | null: false                | 
| image                  | アクティブストレージで実装 | アクティブストレージで実装 | 
| description            | text                       | null: false                | 
| category_id            | integer                    | null: false                | 
| condition_id           | integer                    | null: false                | 
| shipping_fee_status_id | integer                    | null: false                | 
| shipping_prefecture_id | integer                    | null: false                | 
| shipping_day_id        | integer                    | null: false                | 
| user                   | references                 | foreign_key: true          | 

### Association
- belongs_to :user
- has_one :purchase

## purchasesテーブル

| Column | Type       | Options           | 
| -------| ---------- | ----------------- | 
| user   | references | foreign_key: true | 
| item   | references | foreign_key: true | 

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## Addressesテーブル

| Column        | Type    | Options     | 
| ------------- | ------- | ----------- | 
| postal_code   | string  | null: false | 
| prefecture_id | integer | null: false | 
| city          | string  | null: false | 
| house_number  | string  | null: false | 
| building_name | string  | default: "" | 
| tel           | string  | null: false | 

### Association
- belongs_to :purchase