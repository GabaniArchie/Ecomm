class AddProvinceIdAndAddressToCustomers < ActiveRecord::Migration[7.1]
  def change
    add_column :customers, :province_id, :integer
    add_column :customers, :address, :string
  end
end
