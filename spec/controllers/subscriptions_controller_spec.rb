# spec/controllers/api/v1/subscriptions_controller_spec.rb

require 'rails_helper'

RSpec.describe Api::V1::SubscriptionsController, type: :controller do
  let(:customer) { create(:customer) }
  let(:subscription) { create(:subscription) }
  let(:tea_subscription) { create(:subscription, status: 'active') }

  describe 'GET #index' do
    it 'returns a list of subscriptions for a customer' do
      customer.subscriptions << subscription
      get :index, params: { customer_id: customer.id }
      expect(response).to have_http_status(:ok)
      
    end

    it 'returns a list of all subscriptions if customer_id is not present' do
      get :index
      expect(response).to have_http_status(:ok)
      
    end
  end

  

  describe 'POST #subscribe_to_tea_subscription' do

    it 're-subscribes a customer to a canceled tea subscription' do
      customer.subscriptions << subscription
      subscription.update(status: 'canceled')
      post :subscribe_to_tea_subscription, params: { id: customer.id, subscription_id: subscription.id }
      expect(response).to have_http_status(:ok)
    end

    it 'returns an error if the customer already has an active subscription' do
      customer.subscriptions << tea_subscription
      post :subscribe_to_tea_subscription, params: { id: customer.id, subscription_id: tea_subscription.id }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)['error']).to eq("You are already have this subscription")
    end
  end

  describe 'DELETE #cancel_tea_subscription' do
    it 'cancels a customer\'s active tea subscription' do
      customer.subscriptions << tea_subscription
      delete :cancel_tea_subscription, params: { id: customer.id, subscription_id: tea_subscription.id }
      expect(response).to have_http_status(:ok)
      expect(tea_subscription.reload.status).to eq('canceled')
    end

    it 'returns an error if the subscription is not active' do
      customer.subscriptions << subscription
      delete :cancel_tea_subscription, params: { id: customer.id, subscription_id: subscription.id }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)['error']).to eq('You are not subscribed to this') 
    end
  end
end
