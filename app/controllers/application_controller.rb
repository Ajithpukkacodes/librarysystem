class ApplicationController < ActionController::Base
  include SessionsHelper
  def current_user   
    User.where(id: session[:user_id]).first   
  end   
    helper_method :current_user
end
