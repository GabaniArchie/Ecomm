class AddCustomerIdToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :customer_id, :integer
  end
end
