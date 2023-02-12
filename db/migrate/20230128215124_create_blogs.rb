class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :blog_content
      t.string :photo

      t.timestamps
    end
  end
end
