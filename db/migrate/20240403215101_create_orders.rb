class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.text :order_item
      t.string :email
      t.decimal :gst, precision: 8, scale: 2
      t.decimal :pst, precision: 8, scale: 2
      t.decimal :hst, precision: 8, scale: 2
      # Add other columns as needed
      t.timestamps
    end
  end
end
