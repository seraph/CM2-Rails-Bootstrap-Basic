class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    
    if @user
      flash[:success] = "Successfully created your account #{@user.name}"
      redirect_to root_url
    else
      flash.now[:error] = "Failed to create your account"
      render 'new'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
