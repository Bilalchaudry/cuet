class AddClientToOrder < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :cert, null: false, foreign_key: true
    remove_column :orders, :user_id
  end
end
