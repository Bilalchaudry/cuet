class RemoveProductIdFromCert < ActiveRecord::Migration[6.0]
  def change
    remove_column :certs, :product_id, :integer
  end
end
