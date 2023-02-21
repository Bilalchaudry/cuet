class CreateDiscountCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :discount_codes do |t|
      t.string :name
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
