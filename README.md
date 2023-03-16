## usersテーブル

|Column            |Type     |Options                      |
|------------------|---------|-----------------------------|
|nickname          | string  |null: false, uniqueness: true|
|email             | string  |null: false                  |
|encrypted_password| string  |null: false                  |
|first_name        | string  |null: false                  |
|last_name         | string  |null: false                  |
|ruby_first_name   | string  |null: false                  |
|ruby_last_name    | string  |null: false                  |
|yearOfBirth_id    | integer |null: false                  |
|monthOfBirth_id   | integer |null: false                  |
|dayOfBirth_id     | integer |null: false                  |


### Association
has_many :items
has_many :purchases



## itemsテーブル

|Column      |Type      |Options                       |
|------------|----------|------------------------------|
|item_name   |string    |null: false                   |
|description |text      |null: false                   |
|category_id |integer   |null: false                   |
|condition_id|integer   |null: false                   |
|postage_id  |integer   |null: false                   |
|area_id     |integer   |null: false                   |
|days_id     |integer   |null: false                   |
|price       |string    |null: false                   |
|user        |references|null: false, foreign_key: true|

### Association
belongs_to :user
has_one :purchase


## purchasesテーブル

|Column           |Type      |Options                      |
|----------------|----------|------------------------------|
|postCode_id     |integer   |null: false                   |
|province        |string    |null: false                   |
|locality        |string    |null: false                   |
|block           |string    |null: false                   |
|apartment       |string    |                              |
|telephone_number|string    |null: false                   |
|user            |references|null: false, foreign_key: true|
|items           |references|null: false, foreign_key: true|


### Association
belongs_to :user
belongs_to :item