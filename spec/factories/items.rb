FactoryBot.define do
  factory :item do
    name                      { Faker::JapaneseMedia::OnePiece.akuma_no_mi }
    description               { Faker::JapaneseMedia::StudioGhibli.quote }
    category_id               { Faker::Number.between(from: 1, to: 10) }
    status_id                 { Faker::Number.between(from: 1, to: 5) }
    prefecture_id             { Faker::Number.between(from: 1, to: 47) }
    shipping_fee_id           { Faker::Number.between(from: 1, to: 2) }
    shipping_day_id           { Faker::Number.between(from: 1, to: 3) }
    price                     { Faker::Number.between(from: 300, to: 9_999_999) }
    association               :user
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/docker-python.png'), filename: 'test_image.png')
    end
  end
end
