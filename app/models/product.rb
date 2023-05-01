class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :product_type
  has_many :cert_product
  validates_presence_of :title, :name, :description, :size, :price, :benefits, :photo, :ingredients
end
