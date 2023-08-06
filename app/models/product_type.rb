class ProductType < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: :slugged
  validates_presence_of :slug

  has_many :products

end
