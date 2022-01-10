class AddBenefitsToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :benefits, :text
  end
end
