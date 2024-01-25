class CreateTeas < ActiveRecord::Migration[7.0]
  def change
    create_table :teas do |t|

      t.timestamps
    end
  end
end
