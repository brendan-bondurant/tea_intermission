class RemoveForeignKeyFromSubscriptions < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :subscriptions, :customers
  end
end
