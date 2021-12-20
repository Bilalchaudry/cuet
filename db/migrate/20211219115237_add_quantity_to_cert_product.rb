class AddQuantityToCertProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :cert_products, :quantity, :integer, default: 1
  end
end
