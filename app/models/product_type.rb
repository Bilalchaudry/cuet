class ProductType < ApplicationRecord
  has_many :products

  extend FriendlyId
  friendly_id :name, use: :slugged


end
