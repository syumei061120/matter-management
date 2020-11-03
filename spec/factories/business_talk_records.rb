FactoryBot.define do
  factory :business_talk_record do
    start_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    end_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    explain { Faker::Lorem.sentences }

    after(:build) do |item|
      item.files.attach(io: File.open('public/sample1.png'), filename: 'sample1.png')
    end
    association :user
    association :matter
  end
end
