class CartController < ApplicationController
  before_action :authenticate_client!
  before_action :check_cert_and_product, only: [:show]

  def show
    @cert_count = @cert ? @cert.cert_products.count : ''
    @cart_data = {count: @cert_count, cert_id: @cert.id}
    render json: @cart_data
  end

  def index
    product_ids = current_client.cert.cert_products.pluck(:product_id)
    @products = Product.where(id: product_ids)
    @cert_products = current_client.cert.cert_products
  end

  def show_cart
    @cert = Cert.find (params[:id])
    @cert_products = @cert.cert_products
    product_ids = @cert_products.pluck(:product_id)
    @products = Product.where(id: product_ids)
  end

  def update
    @cert = Cert.find(1)
    cart_products = @cert.cert_products
    keys = params[:products].keys
    keys.each do |key|
      product = cart_products.find(params[:products][key]['id'])
      product.update(quantity: params[:products][key]['quantity'])
    end
  end

  def delete
  end

  private

  def check_cert_and_product
    @certs = current_client&.certs
    @cert = @certs.find_by(ordered?: false)  if @certs
    if @cert.present? && @certs.present?
      @cert.cert_products.create(product_id: params[:product_id])
    else
      @cert = Cert.create(client_id: current_client.id)
      @cert.cert_products.create(product_id: params[:product_id])
    end
  end
end
