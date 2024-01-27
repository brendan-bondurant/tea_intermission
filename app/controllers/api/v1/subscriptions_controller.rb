class Api::V1::SubscriptionsController < ApplicationController
  def index
    if params["customer_id"].present?
    customer = Customer.find(params["customer_id"])
    subscriptions = customer.subscriptions
    render json: SubscriptionSerializer.new(subscriptions).to_json, status: :ok
    else
    render json: Subscription.all
    end
  end

  def subscribe_to_tea_subscription
    customer = Customer.find(params[:id])
    subscription = Subscription.find(params[:subscription_id])
    if customer.subscriptions.exists?(subscription.id) && subscription.status == "active"
      render json: {
        error: 'You are already have this subscription'
      }, status: :unprocessable_entity
    elsif customer.subscriptions.exists?(subscription.id) && subscription.status == "canceled"
      subscription.update(status: "active")
      render json: {
        message: 'You are re-subscribed',
        customer: customer, 
        subscription: subscription
      }, status: :ok
    elsif
      subscription.status = "active"
      customer.subscriptions << subscription
      render json: {
        message: "You are now subscribed to #{sub}",
        customer: customer,
        subscription: subscription
      }, status: :ok
    end
  end

  def cancel_tea_subscription
    customer = Customer.find(params[:id])
    subscription = Subscription.find(params[:subscription_id])
    if customer.subscriptions.exists?(subscription.id) && subscription.status == "active"
      subscription.update(status: "canceled")
      render json: {
        message: 'You are no longer subscribed to this',
        customer: customer, 
        subscription: subscription
      }, status: :ok
    else
      render json: {
        error: 'You are not subscribed to this'
      }, status: :unprocessable_entity
    end
  end

  def show
    subscriptions = customer.subscriptions
    render json: SubscriptionSerializer.new(subscriptions).to_json, status: :ok
  end

  private
  def subscription_params
    params.require(:subscription).permit(:title, :price, :status, :frequency)
  end
end