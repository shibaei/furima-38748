FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 
    password              
    

    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    encrypted_password    {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {'てすと'}
    last_name             {'てすと'}
    ruby_first_name       {'テスト'}
    ruby_last_name        {'テスト'}
    birthday              {Faker::Date.between(from: '1930-01-01', to: Date.today.years_since(5))}
  end
end