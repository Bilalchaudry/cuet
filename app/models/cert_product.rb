class CertProduct < ApplicationRecord
  belongs_to :cert
  belongs_to :product

  def self.ransackable_attributes(auth_object = nil)
    ["cert_id", "created_at", "id", "id_value", "product_id", "quantity", "updated_at"]
  end
end
