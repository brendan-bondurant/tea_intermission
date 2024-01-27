require 'rails_helper'

RSpec.describe 'customer controller' do
  let(:customer) { create(:customer) }

  before do 
    3.times do
      subscription = create(:subscription)
      customer.subscriptions << subscription # Associate the subscription with the customer

      rand(1..5).times do
        tea = create(:tea)
        subscription.teas << tea # Associate the tea with the subscription
      end
    end
  end

  describe 'Customer with subscriptions and teas' do
    it 'creates a customer with 3 subscriptions and random teas' do

      expect(customer.subscriptions.count).to eq(3)
      customer.subscriptions.each do |subscription|
        expect(subscription.teas.count).to be_between(1, 5)
      end
    end
  end
end