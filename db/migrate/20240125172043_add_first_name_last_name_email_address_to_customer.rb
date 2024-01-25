class AddFirstNameLastNameEmailAddressToCustomer < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :first_name, :string
    add_column :customers, :last_name, :string
    add_column :customers, :email, :string
    add_column :customers, :address, :string
  end
end
