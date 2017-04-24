class ChargesController < ApplicationController
  def new
    if session[:user_id]
    @user = current_user
  else
    @user = nil
  end
  @products = Product.all
  end

  def show
      @product = Product.find(params[:id])
      @reviews = Message.where(product_id: @product.id)
      @message = Message.new
      if(cookies[:order_id].nil?)
      cookies[:order_id] =".-1."
      end
  end

  def create
    # Amount in cents
    @amount = 500
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
