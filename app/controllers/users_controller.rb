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

  def update
    @user = current_user
    @user.update(update_params)
    redirect_to '/charges/new'
  end

  private
  def user_params
    params.require(:user).permit(:username,:password)
  end

  def update_params
    params.require(:user).permit(:adress, :name, :apartment, :zipcode, :country, :state)
  end

end
