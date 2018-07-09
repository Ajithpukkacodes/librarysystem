class SessionsController < ApplicationController
  
  def new
  end
  def show
  end
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to viewpage_path, notice: 'user successfully Loggedin!'
    else
      render 'new',notice: 'Wrong credentials'
    end
  end
  def destroy
  	session[:user_id] = nil   
    redirect_to root_url, notice: 'Logged out!'   
  end
end
