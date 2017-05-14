class ProductController < ApplicationController

  def index
    puts "WERE IN INDEX HEY"
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


end
