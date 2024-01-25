class Api::V1::CustomersController < ApplicationController
  def show
    customer = Customer.find(params[:id])
    
    
    render json: view(customer)
  end

  private
  def view(customer)
    personal_data = CustomerSerializer.new(customer).serializable_hash
    subscription_info = customer.subscriptions
    subscriptions = subscription_info.map do |subscription|
      serialized_subscription = SubscriptionSerializer.new(subscription).serializable_hash[:data][:attributes]
      serialized_teas = subscription.teas.map do |tea|
        TeaSerializer.new(tea).serializable_hash[:data][:attributes]
      end
      serialized_subscription.merge(teas: serialized_teas)
    end  
    response_data = {
      data: { 
        customer: personal_data[:data][:attributes],        
        subscribed_to: subscriptions
      }
    }
    response_data
  end
end