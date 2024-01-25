require 'rails_helper'

describe 'customer API' do
  it "has customer information" do
    create_list(:customer, 3)
    get '/api/v1/customers'
    expect(response).to be_successful
  end

end