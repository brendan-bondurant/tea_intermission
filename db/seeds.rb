# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
customers = Array.new(10) { FactoryBot.create(:customer) }
tea_options = Array.new(10) { FactoryBot.create(:tea) }
subscription_options = Array.new(5) { FactoryBot.create(:subscription) }

# Create subscriptions for each customer
customers.each do |customer|
  rand(1..3).times do
    subscription = FactoryBot.create(:subscription, customer: customer)
    
    # Randomly associate 1 to 5 teas with each subscription
    tea_options.sample(rand(1..5)).each do |tea|
      FactoryBot.create(:subscription_tea, subscription: subscription, tea: tea)
    end
  end
end
