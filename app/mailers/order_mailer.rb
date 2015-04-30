class OrderMailer < ActionMailer::Base
  default from:  "rubyshop@example.com"

  def order_email(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: 'Your order on RubyShop is completed')
  end

end
