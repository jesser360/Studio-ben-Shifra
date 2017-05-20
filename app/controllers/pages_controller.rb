class PagesController < ApplicationController

def home
    if session[:user_id]
    @user = current_user
      if(cookies[:order_id])
        @orders = []
        @items = cookies[:order_id].split('.')[1..-1]
        @items.each do |item|
          if (Order.find_by_id(item))
            @orders.push(Order.find(item))
          end
        end
      @orders.each do |order|
        order.user_id = @user.id.to_s
        order.save
      end
    end
  else
    @user = nil
end
@products = Product.all
end

def about
end

end
