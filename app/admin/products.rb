ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :title, :description, :size, :price, :benefits, :ingredients, :product_type_id, :photo
  form do |f|
    f.inputs "New Product" do
      f.input :product_type
      f.input :name
      f.input :title
      f.input :price, as: :number
      f.input :size
      f.input :ingredients, as: :quill_editor
      f.input :description
      f.input :benefits, as: :quill_editor
      f.input :photo
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :title
      row :price
      row :size
      row :description
      row('Product Type') { |b| b.product_type.name }
      row :photo do |ad|
        image_tag ad.photo.url, style: 'width: 100px;' rescue nil
      end
    end

    panel "All Benefits" do
      table_for product do
        column("Benefits") { |e| raw(e.benefits) }
      end
    end

    panel "All Ingredients" do
      table_for product do
        column("Ingredients") { |e| raw(e.ingredients) }
      end
    end
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :size, :price, :product_type_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
