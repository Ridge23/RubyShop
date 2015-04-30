class MakeOrderController < ApplicationController
  before_filter :authenticate_user!

  def index
    current_order = Order.find_by_session_id(cookies[:cart_id])
    user = current_user
    OrderMailer.order_email(user, current_order)
  end
end
