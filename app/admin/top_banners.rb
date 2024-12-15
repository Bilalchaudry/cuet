ActiveAdmin.register TopBanner do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :publish


  form do |f|
    f.inputs "New Top Banner" do
      f.input :name
      f.input :publish
      f.input :description, as: :quill_editor
    end
    f.actions
  end
  
end
