class CreateCertProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :cert_products do |t|
      t.references :cert, null: false, foreign_key: true

      t.timestamps
    end
  end
end
