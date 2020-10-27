FactoryBot.define do
  factory :matter do
    matter_name { Faker::Lorem.word }
    matter_explain { Faker::Lorem.sentence }
    product { Faker::Lorem.word }
    sale_price { Faker::Number.number(digits: 10) }
    profit_price { Faker::Number.number(digits: 10) }
    sale_time { Faker::Date.between(from: '2021-1-1', to: '2022-12-31') }
    priority_id { Faker::Number.between(from: 1, to: 3) }
    reliability_id { Faker::Number.between(from: 1, to: 6) }
    progress_id { Faker::Number.between(from: 1, to: 6) }
    occasion { Faker::Lorem.word }
    staff_in_charge { Gimei.name.kanji }
    is_edited { Faker::Boolean.boolean }
  end
end
