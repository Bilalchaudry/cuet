class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  extend FriendlyId
  friendly_id :name, use: :slugged


  belongs_to :product_type

  has_many :cert_product
  has_many :reviews

  validates_presence_of :title, :name, :description, :size, :price, :benefits, :photo, :ingredients, :slug

end
