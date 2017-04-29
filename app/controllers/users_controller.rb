class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome!"
      redirect_to '/'
      session[:user_id] = @user.id
    else
      flash[:error] = "Email already exists,please choose another"
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username,:password)
  end

end
