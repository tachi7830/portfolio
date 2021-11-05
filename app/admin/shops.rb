ActiveAdmin.register Shop do
  permit_params :name, :description, :news, :url, :area, :address, :phone_number, :opening_hour, :closed_day
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :description, :news, :url, :area, :address, :phone_number, :opening_hour, :closed_day
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :news, :url, :area, :address, :phone_number, :opening_hour, :closed_day]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
