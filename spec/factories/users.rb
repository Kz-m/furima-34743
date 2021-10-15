FactoryBot.define do
  factory :user do
    transient do
      user { Gimei.name }
    end
    nickname               { Faker::Name.name }
    email                  { Faker::Internet.free_email }
    password = 'a1' + Faker::Internet.password(min_length: 6)
    password_confirmation  { password }
    family_name            { user.first.kanji }
    given_name             { user.last.kanji }
    family_name_kana       { user.first.katakana }
    given_name_kana        { user.last.katakana }
    date_of_birth          { Faker::Date.backward }
  end
end
