class CreateCerts < ActiveRecord::Migration[6.0]
  def change
    create_table :certs do |t|
      t.references :client, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
