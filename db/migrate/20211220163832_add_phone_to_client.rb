class AddPhoneToClient < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :phone, :string
    add_column :clients, :address, :string
  end
end
