ActiveAdmin.register Item, as: "Main Items" do
  actions :index, :sort
  config.sort_order = 'priority_id_asc'

  index do
    id_column
    column :name
    column :show_on_main
    column :price
    column :created_at
  end

  collection_action :sort, :method => :post do
    params[:item].each_with_index do |id, index|
      item = Item.find(id)
      item.update(priority_id: index+1)
    end
    render :nothing => true
  end

  controller do
    def scoped_collection
      Item.where(show_on_main: true).order(:priority_id)
    end
  end
end