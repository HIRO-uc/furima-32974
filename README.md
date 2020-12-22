# テーブル設計

## usersテーブル

| Column          | Type   | Options     | 
| --------------- | ------ | ----------- | 
| nickname        | string | null: false | 
| email           | string | null: false | 
| password        | string | null: false | 
| last_name       | string | null: false | 
| first_name      | string | null: false | 
| last_name_kana  | string | null: false | 
| first_name_kana | string | null: false | 
| birth_date      | date   | null: false | 

### Association
- has_many :items
- has_many :purchases

## itemsテーブル

| Column           | Type                       | Options                    | 
| ---------------- | -------------------------- | -------------------------- | 
| price            | integer                    | null: false                | 
| name             | string                     | null: false                | 
| image            | アクティブストレージで実装 | アクティブストレージで実装 | 
| description      | text                       | null: false                | 
| category         | integer                    | null: false                | 
| condition        | integer                    | null: false                | 
| shipping_expense | integer                    | null: false                | 
| shipping_area    | integer                    | null: false                | 
| shipping_days    | integer                    | null: false                | 
| seller_id        | references                 | foreign_key: true          | 

### Association
- belongs_to :user
- has_one :purchase

## purchasesテーブル

| Column   | Type       | Options           | 
| -------- | ---------- | ----------------- | 
| price    | integer    | null: false       | 
| buyer_id | references | foreign_key: true | 
| item_id  | references | foreign_key: true | 

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## Addressesテーブル

| Column        | Type    | Options     | 
| ------------- | ------- | ----------- | 
| postal_code   | string  | null: false | 
| prefecture    | integer | null: false | 
| city          | string  | null: false | 
| house_number  | string  | null: false | 
| building_name | string  | default: "" | 
| tel           | integer | null: false | 

### Association
- belongs_to :purchase