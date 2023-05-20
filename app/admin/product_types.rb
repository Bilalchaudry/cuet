ActiveAdmin.register ProductType do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :seo_tags
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
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
