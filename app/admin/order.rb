ActiveAdmin.register Order do
  permit_params :order_item, :user_id

  form do |f|
    f.inputs "Order Details" do
      f.input :items
      f.input :user, :collection => User.all.map{|u| ["#{u.email}", u.id]}
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit!
    end
  end

end
