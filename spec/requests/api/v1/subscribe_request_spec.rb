require 'rails_helper'

describe 'Subscription API' do
  it "has subscription information" do

    get '/api/v1/subscriptions'

    expect(response).to be_successful



  end

end