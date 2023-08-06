class AddNameToReview < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :name, :string, null: false
    add_column :reviews, :email, :string, null: false
    add_column :reviews, :publish, :boolean, default: false
  end
end
