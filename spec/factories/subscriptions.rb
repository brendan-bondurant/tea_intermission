FactoryBot.define do
  factory :subscription do
    title { Faker::Subscription.plan }
    price { Faker::Number.number(digits: 1) }
    status { Faker::Subscription.status }
    frequency { Faker::Subscription.payment_term }
  end
end
