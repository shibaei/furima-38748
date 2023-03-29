## usersテーブル

|Column            |Type     |Options                      |
|------------------|---------|-----------------------------|
|nickname          | string  |null: false                  |
|email             | string  |null: false, uniqueness: true|
|encrypted_password| string  |null: false                  |
|first_name        | string  |null: false                  |
|last_name         | string  |null: false                  |
|ruby_first_name   | string  |null: false                  |
|ruby_last_name    | string  |null: false                  |
|birthday          | date    |null: false                  |



### Association
has_many :items
has_many :purchases



## itemsテーブル

|Column              |Type      |Options                       |
|--------------------|----------|------------------------------|
|item_name           |string    |null: false                   |
|description         |text      |null: false                   |
|category_id         |integer   |null: false                   |
|condition_id        |integer   |null: false                   |
|postage_id          |integer   |null: false                   |
|province_id         |integer   |null: false                   |
|shipping_day_id     |integer   |null: false                   |
|price               |string    |null: false                   |
|user                |references|null: false, foreign_key: true|

### Association
belongs_to :user
has_one :purchase

## purchasesテーブル

|Column           |Type      |Options                      |
|----------------|----------|------------------------------|
|user            |references|null: false, foreign_key: true|
|items           |references|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :item
has_one :delivery

## deliverysテーブル

|Column           |Type      |Options                      |
|----------------|----------|------------------------------|
|postcode        |string    |null: false                   |
|province_id     |integer   |null: false                   |
|locality        |string    |null: false                   |
|block           |string    |null: false                   |
|apartment       |string    |                              |
|telephone_number|string    |null: false                   |
|purchase        |references|null: false, foreign_key: true|


### Association
belongs_to :purchase