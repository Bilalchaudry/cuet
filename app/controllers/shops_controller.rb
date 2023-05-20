class ShopsController < ApplicationController
  def index
    @title = "Revitalize Your Skin with Ceutisol Pharma Skin Care"
    @all_products = Product.all.order(price: :desc)
    @cover_photo = CoverPhoto.find_by(publish: true)
    @slid_images = SlideImage.where(publish: true) rescue nil
    check_cart if current_client.present?
  end

  private
  def check_cart
    cart = current_client.certs.find_by(ordered?: false) if current_client.certs.present?
    @cart_available = cart.present? ? true : false
  end
end
