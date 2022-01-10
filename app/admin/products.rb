ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :size, :price, :benefits, :product_type_id, :photo
  form do |f|
    f.inputs "New Product" do
      f.input :product_type
      f.input :name
      f.input :price, as: :number
      f.input :size
      f.input :description
      f.input :benefits, as: :quill_editor
      f.input :photo
    end
    f.actions
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
