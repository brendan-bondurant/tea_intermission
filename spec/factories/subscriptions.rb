FactoryBot.define do
  factory :subscription do
    title { Faker::Subscription.plan }
    price { Faker::Number.number(digits: 1) }
    status { ["subscribed", "cancelled"].sample }
    frequency { ["weekly", "bi-weekly", "monthly", "bi-monthly"].sample }
    customer
  end
end
