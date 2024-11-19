class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  extend FriendlyId
  friendly_id :name, use: :slugged


  belongs_to :product_type

  has_many :cert_product
  has_many :reviews

  validates_presence_of :title, :name, :description, :size, :price, :benefits, :photo, :ingredients, :slug

  def self.ransackable_attributes(auth_object = nil)
    ["benefits", "created_at", "description", "faq", "id", "id_value", "ingredients", "name", "photo", "price", "product_type_id", "seo_tags", "size", "slug", "title", "updated_at"]
  end


  def self.ransackable_associations(auth_object = nil)
    ["cert_product", "product_type", "reviews"]
  end

end
