FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname           {Faker::Name.initials(number: 2)}
    email              {Faker::Internet.free_email}
    password           {Faker::Lorem.characters(number: 10, min_alpha: 4, min_numeric: 1)}
    last_name          { person.last.kanji }
    first_name         { person.first.kanji }
    last_name_kana     { person.last.katakana }
    first_name_kana    { person.first.katakana }
    birthday           { Faker::Date.backward }
  end
end