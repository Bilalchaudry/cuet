class AddSlugToProductType < ActiveRecord::Migration[6.0]
  def change
    add_column :product_types, :slug, :string
    add_index :product_types, :slug, unique: true
  end
end
