class ProductsController < ApplicationController
  def index
  end

  def show
    @cert_product = CertProduct.new
    @product = Product.friendly.find(params[:id].parameterize)
    @cert = current_client&.certs&.find_by(ordered?: false)
    @cert_product = @cert.cert_products&.find_by(product_id: @product.id) if @cert.present?
  end

  def product_type_products
    @product_type = ProductType.friendly.find(params[:id].parameterize)
    @products = @product_type.products
  end
end
