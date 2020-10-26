FactoryBot.define do
  factory :user do
    gimei=Gimei.name
    family_name {gimei.last_kanji}
    first_name {gimei.first_kanji}
    family_name_kana {gimei.last_katakana}
    first_name_kana {gimei.last_katakana}
    email {Faker::Internet.free_email}

    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}

    administrator { Faker::Number.between(from: 1, to: 2) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end