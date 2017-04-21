class PagesController < ApplicationController

  def home
    if session[:user_id]
    @user = current_user
  else
    @user = nil
  end
end

end
