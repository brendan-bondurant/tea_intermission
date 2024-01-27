class RemoveCustomerIdFromSubscriptions < ActiveRecord::Migration[7.0]
  def change
    remove_index :subscriptions, name: "index_subscriptions_on_customer_id"
    remove_column :subscriptions, :customer_id, :bigint
  end
end
