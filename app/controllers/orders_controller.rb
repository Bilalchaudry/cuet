class OrdersController < ApplicationController

  def create
    @cert = Cert.find(params[:id])
    cert_products = @cert.cert_products
    order = Order.create(client_id: current_client.id, cert_id: @cert.id)
    cert_products.each do |product|
      order.order_products.create(product_id: product.product_id, product_total_price: product.quantity * product.product.price)
    end
    @cert.update(ordered?: true)
    if order
      ClientMailer.with(user: "bilalahmer1995@gmail.com").order_email_to_client.deliver_later
    end
    redirect_to root_path
  end

  def update
  end
end
