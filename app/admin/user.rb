ActiveAdmin.register User do

  permit_params :email

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :created_at
    column :updated_at
    actions
  end

end
