class AddSeoTagToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :seo_tags, :text
    add_column :product_types, :seo_tags, :text
  end
end
