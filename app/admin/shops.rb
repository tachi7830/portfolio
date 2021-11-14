ActiveAdmin.register Shop do
  permit_params :name, :description, :news, :url, :prefecture_code, :address, :phone_number, :opening_hour, :closed_day, :image

    form do |f|
      f.inputs "Shops" do
        f.input :name
        f.input :description
        f.input :news
        f.input :prefecture_code, as: :select, collection: JpPrefecture::Prefecture.all.map {|prefecture| [prefecture.name]}
        f.input :address
        f.input :url
        f.input :phone_number
        f.input :opening_hour
        f.input :closed_day
        f.input :image
      end
      f.actions
    end

    show do |item_image|
      attributes_table do
        row :name
        row :description
        row :news
        row :prefecture_code
        row :address
        row :url
        row :phone_number
        row :opening_hour
        row :closed_day
        # show画面で画像を表示するためのタグを追加
        row :image do
          image_tag(shop.image.url)
        end
      end
    end
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
