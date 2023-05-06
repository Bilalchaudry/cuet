class AddFaqToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :faq, :text
    add_column :products, :slug, :string
  end
end
