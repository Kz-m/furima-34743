FactoryBot.define do
  factory :ship do
    zipcode                { Faker::Address.zip_code }
    prefecture_id          { Faker::Number.between(from: 1, to: 48) }
    locality               { Faker::Address.city_prefix }
    address                { Faker::Address.street_address }
    building_name          { Faker::Address.community }
    phone_number           { Faker::PhoneNumber.cell_phone }
    #token                 {}
  end
end
