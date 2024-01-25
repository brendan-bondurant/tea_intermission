require 'rails_helper'

describe 'customer API' do
  it "has customer information" do
    create_list(:customer, 3)
    get api_v1_customer_path
    expect(response).to be_successful
    customers = JSON.parse(response.body)
    require 'pry'; binding.pry
  end

end