class ChargesController < ApplicationController

  def new
    if(session[:user_id])
      @orders = Order.where(user_id: session[:user_id]).where(is_bought: false)
      @user = current_user
    elsif(cookies[:order_id])
      @orders = []
      @items = cookies[:order_id].split('.')[1..-1]
      @items.each do |item|
        if (Order.find_by_id(item))
          @orders.push(Order.find(item))
        end
      end
      @user = nil
    end
  end


  def create
    @orders = Order.where(user_id: session[:user_id]).where(:is_bought => false)
    @user = current_user
    @order_total = 0
    @orders.each do |order|
      order.is_bought = true
      order.save
    @order_total += (order.amount * order.quantity)
    end
    @amount = @order_total * 100
    token = params[:stripeToken]
    # customer = Stripe::Customer.create(
    #   :email => @user.username,
    #   :source  => token
    # )
    charge = Stripe::Charge.create(
      :amount      => @amount,
      :currency    => 'usd',
      :description => 'Charge from Studio ben Shifra',
      :receipt_email => @user.username,
      :source => token
      )
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

 end
