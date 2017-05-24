class ProductController < ApplicationController

  def index
    @group = product_params[:group]
    puts "WERE IN INDEX HEY"
    puts @group
    if session[:user_id]
    @user = current_user
  else
    @user = nil
  end
  @products = Product.where(group: @group)
  end

  def show
      @product = Product.find(params[:id])
      @reviews = Message.where(product_id: @product.id)
      @message = Message.new
  end

  private
  def product_params
    params.permit(:group)
  end

end
