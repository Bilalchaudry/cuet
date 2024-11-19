class ProductType < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: :slugged
  validates_presence_of :slug

  has_many :products

  def self.ransackable_associations(auth_object = nil)
    ["products"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "id_value", "name", "seo_tags", "slug", "updated_at"]
  end

end
