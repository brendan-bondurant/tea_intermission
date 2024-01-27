Rails.application.routes.draw do

namespace :api do
  namespace :v1 do
    post '/customers/:id/subscriptions/:subscription_id', to: 'subscriptions#subscribe_to_tea_subscription'

    delete '/customers/:id/subscriptions/:subscription_id', to: 'subscriptions#cancel_tea_subscription'

    # get '/customers/:id', to: 'customers#show', as: 'api_v1_customer'
    
    resources :customers do
      resources :subscriptions
    end

    resources :subscriptions do
      resources :teas
    end

    resources :teas
  end
end
end