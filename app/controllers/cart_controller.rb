class CartController < ApplicationController
  before_action :authenticate_client!
  before_action :check_cert_and_product, only: [:show, :add_to_cart]

  def show
    @cert_count = @cert ? @cert.cert_products.count : ''
    @cart_data = { count: @cert_count, cert_id: @cert.id }
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
    @cert = Cert.find(params[:c_id])
    cart_products = @cert.cert_products
    keys = params[:products].keys
    keys.each do |key|
      product = cart_products.find_by(product_id: params[:products][key]['id'])
      product.update(quantity: params[:products][key]['quantity'])
    end
  end

  def add_to_cart
    @certs = current_client&.certs
    @cert = @certs.find_by(ordered?: false) if @certs
    if @cert.present? && @certs.present?
      quantity = params[:cert_product][:quantity].present? ? params[:cert_product][:quantity].to_i : 1
      cert_product = @cert.cert_products.find_by(product_id: params[:id])
      if cert_product.present?
        cert_product.update(quantity: quantity)
      else
        @cert.cert_products.create!(product_id: params[:id], quantity: quantity)
      end
    else
      @cert = Cert.create(client_id: current_client.id)
      quantity = params[:quantity].present? ? params[:quantity].to_i : 1
      @cert.cert_products.create!(product_id: params[:id], quantity: quantity)
    end
    render :js => "window.location = '#{root_url}'"
  end

  def delete
    @cert = Cert.find (params[:id])
    @cert_products = @cert.cert_products
    @cert_products.find_by(product_id: params[:p_id]).delete
    product_ids = @cert_products.pluck(:product_id)
    @products = Product.where(id: product_ids)
    redirect_to show_cart_path
  end

  private

  def check_cert_and_product
    @certs = current_client&.certs
    @cert = @certs.find_by(ordered?: false) rescue nil
    if @cert.present?
      quantity = params[:quantity].present? ? params[:quantity].to_i : 1
      @cert.cert_products.create(product_id: params[:product_id], quantity: quantity)
    else
      @cert = Cert.create(client_id: current_client.id)
      quantity = params[:quantity].present? ? params[:quantity].to_i : 1
      @cert.cert_products.create(product_id: params[:product_id], quantity: quantity)
    end
  end
end
