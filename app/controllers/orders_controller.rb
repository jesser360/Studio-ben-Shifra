class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
    def index
      if(cookies[:order_id].nil?)
      cookies[:order_id] =".-1."
      end
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
    if(session[:user_id])
      @user = current_user
      @items = []
      @exists = false
      @orders = @user.orders.where(is_bought: false)
      @orders.each do |x|
        @items.push(x[:items])
      end
      puts "WERE IN CREATE ORDERS"
      puts @items
      @product = Product.find(order_params)
      @items.each do |item|
        if(item == @product.title)
          @exists = true
        end
      end
      if(@exists)
        redirect_to '/orders'
        flash[:notice] = "already in your cart"
      else
        @order = Order.new(params = {})
        @order.amount = @product.price
        @order.image = @product.image
        @order.items = @product.title
        @order.quantity = 1
        @order.user = current_user
        @order.is_bought = false
        @order.save
        redirect_to '/orders'
      end
    else
      @product = Product.find_by_id(order_params)
      puts "FINDING PRODUCT FOR CART!"
      puts @product.title
      @duplicate = false
      @check = []
      @order = Order.new(params = {})
      @order.amount = @product.price
      @order.image = @product.image
      @order.items = @product.title
      @order.quantity = 1
      @order.user = nil
      @order.is_bought = false
      @order.save
      puts "MADE NEW ORDER HERE"
      puts @order.id.to_s
      @items = cookies[:order_id].split('.')[1..-1]
      @items.each do |item|
        if (Order.find_by_id(item))
          @check.push(Order.find_by_id(item))
        end
      end
      @check.each do |x|
        if(x.items == @order.items)
          @duplicate = true
        end
      end
      if (@duplicate == false)
        cookies[:order_id]+= @order.id.to_s + '.'
        cart = cookies[:order_id] || "empty"
      end
      redirect_to '/orders'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to '/orders'
  end

  def increase
    @order = Order.find(params[:id])
    @order.quantity += 1
    @order.save
    redirect_to '/orders'
  end

  def decrease
    @order = Order.find(params[:id])
    @order.quantity -= 1
    @order.save
    if(@order.quantity == 0)
      @order.destroy
    end
    redirect_to '/orders'
  end

  def history
    @orders = Order.where(user_id: session[:user_id]).where(is_bought: true)
    @user = current_user
  end


  private
  def order_params
    params.require(:id)
  end

end
