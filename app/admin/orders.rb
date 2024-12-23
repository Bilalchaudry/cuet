ActiveAdmin.register Order do
  permit_params :status


  index do
    selectable_column
    column :client
    column :cert
    column :order_total do |order|
      order.order_total < 1000 ? order.order_total + 100 : order.order_total
    end
    column :status
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row('Cleint Name') { order.client.name }
      row('Cleint Email') { order.client.email }
      row('Phone') { order.client.phone }
      row('Order Total PKR') do
        total = order.order_total
        total < 1000 ? total + 100 : total
      end
      row('Status') { order.status }
      row('Address') { order.client.address }
      row "PDF" do
          link_to("pdf", order_pdf_path(format: :pdf, order_id: order.id))
      end
      row :created_at
    end
    panel 'Ordered Products' do
      table_for order.order_products.order(:created_at).each do |o|
        column('Name') { |o| o.product.name }
        column('Product Price') { |o| o.product.price }
        column('Ordered Quantity') { |o| o.quantity }
      end
    end
  end

  controller do
    def update
      super
      case params[:order][:status]
      when "Shipped"
        ClientMailer.with(order: @order).shipped.deliver_later
      when "Delivered"
        ClientMailer.with(order: @order).delivered.deliver_later
      when "Cancelled"
        ClientMailer.with(order: @order).cancelled.deliver_later
      end
    end
  end

end
