class OrderController < ApplicationController
  def add_item
    current_order = Order.find_or_create_by(session_id: cookies[:cart_id], is_finished: false)
    item_to_add = Item.find(params[:item_id])
    current_order.items << item_to_add
    current_order.save

    @response = [:status => 'success']
    respond_to do |format|
      format.json { render :json => @response }
    end
  end

  def cart
    current_orders = Order.where(session_id: cookies[:cart_id], is_finished: false)
    current_order = current_orders[0]
    full_price = 0
    if current_order
      if current_order.items
        full_price = current_order.total_price
        @items = current_order.items
      end
    end

    @full_price = full_price
  end

  def delete_item
    item_to_delete = Item.find(params[:item_id])
    current_orders = Order.where(session_id: cookies[:cart_id], is_finished: false)
    current_order = current_orders[0]
    current_order.items.delete(item_to_delete)

    @response = [:status => 'success', :item_id => item_to_delete.id]
    respond_to do |format|
      format.json { render :json => @response }
    end
  end

end
