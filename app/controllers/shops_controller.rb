class ShopsController < ApplicationController
  def index
    @all_products = Product.all
    @cover_photo = CoverPhoto.find_by(publish: true)
    check_cart if current_client.present?
  end

  private
  def check_cart
    cart = current_client.certs.find_by(ordered?: false) if current_client.certs.present?
    @cart_available = cart.present? ? true : false
  end
end
