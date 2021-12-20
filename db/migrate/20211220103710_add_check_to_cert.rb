class AddCheckToCert < ActiveRecord::Migration[6.0]
  def change
    add_column :certs, :ordered?, :boolean, default: false
  end
end
