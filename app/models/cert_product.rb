class CertProduct < ApplicationRecord
  belongs_to :cert
  belongs_to :product
end
