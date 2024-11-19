class Order < ApplicationRecord
  belongs_to :client
  has_many :order_products
  enum status: {
    Pending: 0,
    Shipped: 1,
    Delivered: 2,
    Cancelled: 3
  }

  def self.ransackable_associations(auth_object = nil)
    ["client", "order_products"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["cert_id", "client_id", "created_at", "id", "id_value", "order_total", "status", "updated_at"]
  end

end
