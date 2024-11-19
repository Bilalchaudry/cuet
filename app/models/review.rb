class Review < ApplicationRecord
  belongs_to :product

  def self.ransackable_attributes(auth_object = nil)
    ["comment", "created_at", "email", "id", "id_value", "name", "product_id", "publish", "rating", "updated_at"]
  end
end
