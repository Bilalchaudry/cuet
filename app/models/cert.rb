class Cert < ApplicationRecord
  belongs_to :client
  has_many :cert_products, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["client_id", "created_at", "id", "id_value", "ordered?", "updated_at"]
  end


end
