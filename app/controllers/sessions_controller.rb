class SessionsController < ApplicationController
  
  # HTML form view
  def new
  end
  
  # Checks user authentication and signs them in, or displays login form again
  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user and user.authenticate(params[:session][:password])
      log_in(user)
      remember(user)
      flash[:success] = "Welcome back #{user.name}"
      redirect_to root_url
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    logout
    redirect_to root_url
  end
end
