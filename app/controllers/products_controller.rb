class ProductsController < ApplicationController
  def index
  end

  def show
    @cert_product = CertProduct.new
    @product = Product.find params[:id]
    @cert = current_client&.certs&.find_by(ordered?: false)
    @cert_product = @cert.cert_products&.find_by(product_id: @product.id) if @cert.present?
  end
end
