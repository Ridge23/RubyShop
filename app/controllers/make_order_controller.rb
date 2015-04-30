class MakeOrderController < ApplicationController
  before_filter :authenticate_user!

  def index
    current_orders = Order.where(session_id: cookies[:cart_id], is_finished: false)
    current_order = current_orders[0]
    user = current_user
    OrderMailer.order_email(user, current_order)

    current_order.is_finished = true
    current_order.save

    cookies[:cart_id] = Base64.encode64(DateTime.now.to_s)
  end
end
