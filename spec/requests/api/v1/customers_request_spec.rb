require 'rails_helper'

describe 'customer API' do
  before(:each) do
    @customer = Customer.create!(id: 1, first_name: "Brendan", last_name: "Bondurant", email: "test@test.com", address: "1234 W 151st St")
    
    3.times do |subs|
      subscription = @customer.subscriptions.create!(title: "Subscription #{subs}", price: 10, status: "active", frequency: "monthly")

      5.times do |type|
        tea = Tea.create!(title: "Tea #{type}", description: "Description #{type}", temp: 100, brew_time: "5 minutes")
        SubscriptionTea.create!(subscription: subscription, tea: tea)
      end
    end
  end
  
  it 'tells you their name' do
    expect(@customer.first_name).to eq("Brendan")
    expect(@customer.last_name).to eq("Bondurant")
    expect(@customer.email).to eq("test@test.com")
    expect(@customer.address).to eq("1234 W 151st St")
  end


  it "has customer information" do
    customer_id = @customer.id
    get api_v1_customer_path(customer_id)
    expect(response).to be_successful
    customer = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(customer.keys).to eq([:customer, :subscribed_to])
    expect(customer[:customer]).to have_key(:first_name)
    expect(customer[:customer][:first_name]).to be_a(String)

    expect(customer[:customer]).to have_key(:last_name)
    expect(customer[:customer][:last_name]).to be_a(String)

    expect(customer[:customer]).to have_key(:email)
    expect(customer[:customer][:email]).to be_a(String)

    expect(customer[:customer]).to have_key(:address)
    expect(customer[:customer][:address]).to be_a(String)
    expect(customer[:subscribed_to].first.keys).to eq([:title, :price, :status, :frequency, :teas])
    expect(customer[:subscribed_to].first[:teas].first.keys).to eq([:title, :description, :temp, :brew_time])
  end



end