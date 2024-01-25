FactoryBot.define do
  factory :tea do
    title {Faker::Tea.variety}
    description {Faker::Coffee.notes}
    temperature { Faker::Number.number(digits: 3) }
    brew_time {"#{Faker::Number.within(range: 1..10)} minutes"}
  end
end
