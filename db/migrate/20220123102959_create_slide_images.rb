class CreateSlideImages < ActiveRecord::Migration[6.0]
  def change
    create_table :slide_images do |t|
      t.string :image
      t.boolean :publish

      t.timestamps
    end
  end
end
