ActiveAdmin.register Blog do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :blog_content, :photo, :tag, :publish
  form do |f|
    f.inputs "New Blog" do
      f.input :tag
      f.input :title
      f.input :blog_content, as: :quill_editor
      f.input :photo
      f.input :publish
    end
    f.actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :blog_content, :photo]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
