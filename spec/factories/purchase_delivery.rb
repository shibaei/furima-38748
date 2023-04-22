FactoryBot.define do
  factory :purchase_delivery do
    postcode { '123-4567'}
    province { Faker::Number.between(from: 2, to: 48) }
    locality { '新宿区西新宿' }
    block { '1-1' }
    apartment { '東京ハイツ' }
    telephone_number { Faker::Number.number(digits: 11) }
    token {"tok_abcdefghijk00000000000000000"}

  end
end