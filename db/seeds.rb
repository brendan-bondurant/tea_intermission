# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

# Customers
customer1 = Customer.create!(first_name: "Brendan", last_name: "Bondurant", email: "test@test.com", address: "1234 W 151st St")
customer2 = Customer.create!(first_name: "Anthea", last_name: "Y", email: "2@2.com", address: "234 W 2nd St")
customer3 = Customer.create!(first_name: "Shawn", last_name: "C", email: "3@3.com", address: "34 W 3rd St")
customer4 = Customer.create!(first_name: "Nate", last_name: "T", email: "4@4.com", address: "4 W 4th St")
customer5 = Customer.create!(first_name: "Charles", last_name: "R", email: "5@5.com", address: "5 W 6th St")

# Subscriptions
subscription1 = Subscription.create!(title: "Premium", price: 30, status: "canceled", frequency: "monthly")
subscription2 = Subscription.create!(title: "Fancy", price: 40, status: "canceled", frequency: "monthly")
subscription3 = Subscription.create!(title: "Basic", price: 20, status: "canceled", frequency: "weekly")
subscription4 = Subscription.create!(title: "Gold", price: 35, status: "canceled", frequency: "bi-weekly")
subscription5 = Subscription.create!(title: "Silver", price: 25, status: "canceled", frequency: "monthly")

# Teas
tea1 = Tea.create!(title: "Green Tea", temp: 75, description: "A refreshing green tea", brew_time: "3 minutes")
tea2 = Tea.create!(title: "Black Tea", temp: 95, description: "A strong black tea", brew_time: "4 minutes")
tea3 = Tea.create!(title: "Herbal Tea", temp: 100, description: "A caffeine-free herbal infusion", brew_time: "5 minutes")
tea4 = Tea.create!(title: "Oolong Tea", temp: 85, description: "A fragrant oolong tea", brew_time: "4 minutes")
tea5 = Tea.create!(title: "White Tea", temp: 70, description: "A delicate white tea", brew_time: "2 minutes")

# Associations between Customers and Subscriptions
customer1.subscriptions << subscription1 << subscription2
customer2.subscriptions << subscription2
customer3.subscriptions << subscription3 << subscription1 << subscription2
customer4.subscriptions << subscription4
customer5.subscriptions << subscription5 << subscription3 << subscription1 << subscription2

subscription1.teas << tea1 << tea2 << tea3
subscription2.teas << tea1 << tea2 << tea3 << tea4
subscription3.teas << tea1
subscription4.teas << tea1 << tea2
subscription5.teas << tea1 << tea2 << tea3
