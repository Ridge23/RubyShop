class OrderController < ApplicationController
  def order
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
end
