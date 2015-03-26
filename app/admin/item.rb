ActiveAdmin.register Item do
  permit_params :name, :short_description, :description, :category

  index do
    selectable_column
    id_column
    column :name
    column :show_on_main
    column :price
    column :created_at
    actions
  end

  show do |ad|
    attributes_table do
      row :name
      row :short_description
      row :description
      row :category
      row :image do
        image_tag(ad.image.url(:thumb), width: '100')
      end
    end
  end

  form do |f|
    f.inputs "Item Details" do
      f.input :name
      f.input :short_description
      f.input :description
      f.input :price
      f.input :show_on_main
      f.input :category
      f.input :image, :required => false, :as => :file
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit!
    end
  end
end
