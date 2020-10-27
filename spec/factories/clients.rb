FactoryBot.define do
  factory :client do
    company { Faker::Company.name }
    department { Faker::Company.industry }
    name { Gimei.name.kanji }
  end
end
