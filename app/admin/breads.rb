ActiveAdmin.register Bread do
  permit_params :shop_id, :name, :image, :price

    form do |f|
      f.inputs "Breads" do
        f.input :shop
        f.input :name
        f.input :price
        f.input :image
      end
      f.actions
    end

    show do |item_image|
      attributes_table do
        row :shop
        row :name
        row :price
        # show画面で画像を表示するためのタグを追加
        row :image do
          image_tag(bread.image.url)
        end
      end
    end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :shop_id, :name, :image, :price
  #
  # or
  #
  # permit_params do
  #   permitted = [:shop_id, :name, :image, :price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
