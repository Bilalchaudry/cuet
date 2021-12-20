class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :product_type
  has_many :cert_product
end
