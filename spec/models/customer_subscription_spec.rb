require 'rails_helper'

RSpec.describe CustomerSubscription, type: :model do
  describe "associations" do
    it { should belong_to(:subscription)}
    it { should belong_to(:customer)}
  end
end