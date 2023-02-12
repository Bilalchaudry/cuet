class AddTagToBlog < ActiveRecord::Migration[6.0]
  def change
    add_column :blogs, :tag, :string
    add_column :blogs, :publish, :boolean, default: true
  end
end
