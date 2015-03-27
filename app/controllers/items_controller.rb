class ItemsController < ApplicationController

  before_action :set_pages

  def index


    if !params[:search_string]
      @items = Item.where(category_id: params[:cat_id]).paginate(:page => params[:page], :per_page => @per_page)
    else
      @search = params[:search_string]
      wildcard_search = "%#{@search}%"
      cat_id = params[:cat_id]
      @items = Item.where("name LIKE ? AND category_id = ?" , "%#{wildcard_search}%", cat_id).paginate(:page => params[:page], :per_page => @per_page)
    end

    @category = Category.find(params[:cat_id])
  end

  def search
    @search = params[:search_string]
    wildcard_search = "%#{@search}%"
    @items = Item.where("name LIKE ?" , "%#{wildcard_search}%").paginate(:page => params[:page], :per_page => @per_page)

    render 'index'
  end

  def show
    @item = Item.find(params[:id])
  end

  def set_pages
    @pages_count = [3,6,9,12]

    if !params[:per_page]
      @per_page = 3
    else
      @per_page = params[:per_page].to_i
    end
  end
end
