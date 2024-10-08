class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
  end

  def create
    @cert = Cert.find(params[:id])
    total = 0
    cert_products = @cert.cert_products
    @order = Order.create(client_id: current_client.id, cert_id: @cert.id)
    cert_products.each do |product|
      @order.order_products.create(product_id: product.product_id, product_total_price: product.quantity * product.product.price, quantity: product.quantity)
    end
    @order.order_products.each do |product|
      total = total + product.product_total_price
    end
    @order.update(order_total: total)
    @cert.update(ordered?: true)
    if @order
      ClientMailer.with(user: current_client).order_email_to_client(@order).deliver_later
    end
    redirect_to root_path
  end

  def get_pdf
    @order = Order.find(params[:order_id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Order_#{@order.id}", # filename
               template: "orders/order_pdf",
               formats: [:html],
               disposition: :inline,
               layout: 'pdf'
      end
    end

  end

  def client_orders
    @all_orders = current_client.orders.includes(:order_products).order(id: :desc) rescue nil
    @client = current_client
  end

end
