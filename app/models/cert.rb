class Cert < ApplicationRecord
  belongs_to :client
  has_many :cert_products, dependent: :destroy

end
