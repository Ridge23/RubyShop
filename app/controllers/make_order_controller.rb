class MakeOrderController < ApplicationController
  before_filter :authenticate_user!

  def index
    current_order = Order.where(session_id: cookies[:cart_id], is_finished: false).first
    user = current_user
    OrderMailer.order_email(user, current_order)
о    current_order.update_attribute(:is_finished, true)
    cookies[:cart_id] = Base64.encode64(DateTime.now.to_s)
  end
end
