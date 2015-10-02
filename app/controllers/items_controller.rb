class ItemsController < ApplicationController

  before_action :set_pages

  def index
    if !params[:search_string]
      @items = Item.where(category_id: params[:cat_id]).paginate(:page => params[:page], :per_page => @per_page).order("#{@sort_by} ASC")
    else
      @search = params[:search_string]
      @items = Item.where("name LIKE ? AND category_id = ?" , "%#{@search}%", params[:cat_id]).paginate(:page => params[:page], :per_page => @per_page).order("#{@sort_by} ASC")
    end

    @category = Category.find(params[:cat_id])
  end

  def search
    @search = params[:search_string]
    @items = Item.where("name LIKE ?" , "%#{@search}%").paginate(:page => params[:page], :per_page => @per_page).order("#{@sort_by} ASC")
    render 'index'
  end

  def show
    @item = Item.find(params[:id])
  end

  def set_pages
    @pages_count = [3,6,9,12]
    !params[:per_page] ? @per_page = 9 : @per_page = params[:per_page].to_i
    params[:sort_by] ? @sort_by = params[:sort_by] : @sort_by = 'name'
  end
end
