class AddTitleDescriptionTemperatureBrewTimeToTea < ActiveRecord::Migration[7.0]
  def change
    add_column :teas, :title, :string
    add_column :teas, :description, :text
    add_column :teas, :temp, :integer
    add_column :teas, :brew_time, :string
  end
end
