FactoryBot.define do
  factory :sales_staff do
    department { Faker::Company.industry }
    staff { Gimei.name.kanji }
  end
end
