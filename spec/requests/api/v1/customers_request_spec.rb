require 'rails_helper'

describe 'customer API' do
  it "has customer information" do
    get '/api/v1/customers'
    expect(response).to be_successful
  end

end