class RemoveSubscriptionIdFromTeas < ActiveRecord::Migration[7.0]
  def change
    remove_column :teas, :subscription_id, :integer
  end
end
