class AddTitlePriceStatusFrequencyToSubscription < ActiveRecord::Migration[7.0]
  def change
    add_column :subscriptions, :title, :string
    add_column :subscriptions, :price, :integer
    add_column :subscriptions, :status, :string
    add_column :subscriptions, :frequency, :string
  end
end
