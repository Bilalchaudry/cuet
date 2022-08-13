class DiscountCode < ApplicationRecord
  validates_presence_of :pusblish, :start_date, :end_date, :name
  has_many :orders

end
