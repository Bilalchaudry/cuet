class CreateTopBanners < ActiveRecord::Migration[7.1]
  def change
    create_table :top_banners do |t|
      t.string :name
      t.boolean :publish
      t.text :description

      t.timestamps
    end
  end
end
