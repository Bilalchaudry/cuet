ActiveAdmin.register Review do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :rating, :comment, :product_id, :name, :email, :publish
  #
  # or
  #
  # permit_params do
  #   permitted = [:rating, :comment, :product_id, :name, :email, :publish]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    column :id
    column :name
    column :email
    column :rating
    column :comment do |review|
             truncate(review.comment, :length => 40)
  end
    column :publish
    column :created_at
    actions
  end

end
