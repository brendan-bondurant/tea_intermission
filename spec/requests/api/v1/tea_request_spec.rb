require 'rails_helper'

describe 'tea API' do
  it "has tea information" do
    get '/api/v1/teas'
    expect(response).to be_successful
  end

end