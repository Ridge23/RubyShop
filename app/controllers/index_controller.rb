class IndexController < ApplicationController
  def index
    @items = Item.where(show_on_main: true)
  end
end
