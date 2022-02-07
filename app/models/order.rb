class Order < ApplicationRecord
  belongs_to :client
  has_many :order_products
  enum status: {
    Pending: 0,
    Shipped: 1,
    Delivered: 2,
    Cancelled: 3
  }
end
