class UsersController < ApplicationController

  def new
    @user = User.new 
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome!"
      redirect_to '/messages'
      session[:user_id] = @user.id
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username,:password)
  end

end
