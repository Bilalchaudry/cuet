ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :title, :description, :size, :price, :benefits, :ingredients, :product_type_id, :photo, :faq, :slug, :seo_tags
  form do |f|
    f.inputs "New Product" do
      f.input :product_type
      f.input :name
      f.input :title
      f.input :slug
      f.input :price, as: :number
      f.input :size
      f.input :ingredients, as: :quill_editor
      f.input :description
      f.input :benefits, as: :quill_editor
      f.input :faq, as: :quill_editor
      f.input :seo_tags
      f.input :photo
    end
    f.actions
  end

  index do
    column :id
    column :name
    column :title
    column :price
    column :product_type
    column :description do |prod|
      truncate(prod.description, :length => 40)
    end
    column :benefits do |prod|
      truncate(raw(prod.benefits), :length => 40)
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :title
      row :price
      row :slug
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
    panel "FAQS" do
      table_for product do
        column("FAQS") { |e| raw(e.faq) }
      end
    end
  end


  controller do
    def find_resource
      begin
        scoped_collection.find_by(slug: params[:id])
      rescue ActiveRecord::RecordNotFound
        scoped_collection.find(params[:id])
      end
    end
  end
end
