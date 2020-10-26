FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    family_name {gimei.last.kanji}
    first_name {gimei.first.kanji}
    family_name_kana {gimei.last.katakana}
    first_name_kana {gimei.last.katakana}
    email {Faker::Internet.free_email}

    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}

    administrator_id { Faker::Number.between(from: 1, to: 2) }

    after(:build) do |item|
      item.user_image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end