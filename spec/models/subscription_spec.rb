require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe "associations" do
    it { should belong_to(:customer)}
    it { should have_many(:subscription_teas) }
    it { should have_many(:teas) }
  end
end
