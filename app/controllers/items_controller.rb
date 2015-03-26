class ItemsController < ApplicationController

  def index
    @pages_count = [3,6,9,12]

    if !params[:per_page]
      @per_page = 3
    else
      @per_page = params[:per_page].to_i
    end
    @items = Item.where(category_id: params[:cat_id]).paginate(:page => params[:page], :per_page => @per_page)
    @category = Category.find(params[:cat_id])
  end

  def show
    @item = Item.find(params[:id])
  end
end
