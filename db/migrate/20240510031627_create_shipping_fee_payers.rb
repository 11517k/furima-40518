class CreateShippingFeePayers < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_fee_payers do |t|

      t.timestamps
    end
  end
end
