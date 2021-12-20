class AddProductTotalPriceToOrderProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :order_products, :product_total_price, :float
  end
end
