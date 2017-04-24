class PagesController < ApplicationController

def home
    if session[:user_id]
    @user = current_user
  else
    @user = nil
  end
  @products = Product.all

end

def about
end

end
