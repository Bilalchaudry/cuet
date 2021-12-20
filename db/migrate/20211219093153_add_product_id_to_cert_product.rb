class AddProductIdToCertProduct < ActiveRecord::Migration[6.0]
  def change
    add_reference :cert_products, :product, null: false, foreign_key: true
  end
end
