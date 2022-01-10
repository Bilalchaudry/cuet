class CreateCoverPhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :cover_photos do |t|
      t.string :photo
      t.boolean :publish, default: false

      t.timestamps
    end
  end
end
