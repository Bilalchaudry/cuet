class AddOriginalPriceToProduct < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :original_price, :float
  end
end
