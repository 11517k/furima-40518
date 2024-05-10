class CreateDaysToShips < ActiveRecord::Migration[7.0]
  def change
    create_table :days_to_ships do |t|

      t.timestamps
    end
  end
end
