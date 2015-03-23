ActiveAdmin.register Item do
  permit_params :name, :short_description, :description, :category

  show do |ad|
    attributes_table do
      row :name
      row :short_description
      row :description
      row :category
    end
  end

  controller do
    def permitted_params
      params.permit!
    end
  end
end
