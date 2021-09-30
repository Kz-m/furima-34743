FactoryBot.define do
  factory :purchase_form do
    transient do
      home { Gimei.address }
    end
    zipcode                { 1_234_567.to_s.insert(3, '-') }
    prefecture_id          { Faker::Number.between(from: 1, to: 48) }
    locality               { home.city.kanji }
    address                { home.town.kanji }
    building_name          { home.town.hiragana }
    phone_number           { Faker::Number.leading_zero_number(digits: 10, digits: 11) }
    token                  { 'tk_test_aaaaaaaa1111111111111111' }
  end
end