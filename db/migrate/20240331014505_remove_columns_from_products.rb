class RemoveColumnsFromProducts < ActiveRecord::Migration[7.1]
  def change
    remove_column :products, :sale, :string
    remove_column :products, :boolean, :string
  end
end
