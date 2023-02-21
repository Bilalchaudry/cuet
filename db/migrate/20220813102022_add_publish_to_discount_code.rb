class AddPublishToDiscountCode < ActiveRecord::Migration[6.0]
  def change
    add_column :discount_codes, :pusblish, :boolean, default: false
  end
end
