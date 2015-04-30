class OrderController < ApplicationController
  def add_item
    current_order = Order.find_by_session_id(session.id)
    item_to_add = Item.find(params[:item_id])
    if !current_order
      current_order = Order.new
      current_order.session_id = session.id
      current_order.save
    end
    current_order.items << item_to_add
    current_order.save

    @response = [:status => 'success']
    respond_to do |format|
      format.json { render :json => @response }
    end
  end

  def cart
    current_order = Order.find_by_session_id(session.id)
    full_price = 0
    if current_order
      if current_order.items
        current_order.items.each do |item|
          full_price += item.price
        end
        @items = current_order.items
      end
    end


    @full_price = full_price


  end

  def delete_item
    item_to_delete = Item.find(params[:item_id])
    current_order = Order.find_by_session_id(session.id)
    current_order.items.delete(item_to_delete)

    @response = [:status => 'success', :item_id => item_to_delete.id]
    respond_to do |format|
      format.json { render :json => @response }
    end
  end

end