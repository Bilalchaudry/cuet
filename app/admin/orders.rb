ActiveAdmin.register Order do
  show do
    attributes_table do
      row('Cleint Name') { order.client.name }
      row('Cleint Email') { order.client.email }
      row('Order Total PKR') { order.order_total }
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

end
