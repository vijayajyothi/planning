class ApplicationController < ActionController::Base
  protect_from_forgery
  # before_filter :session_expires 
  # before_filter :authenticate

  def authenticate
    if @current_user
    else
      redirect_to login_url
    end
  end 

  def session_expires
    # redirect_to login_url, alert: 'Not authorized. Please login.' if cookies[:aut_token]
    redirect_to login_url, alert: 'Not authorized. Please login.' if cookies[:user]
  end

  private

  def current_user
    @current_user = cookies[:user]
  end

  helper_method :current_user

  def authorize
    redirect_to login_url, alert: 'Not authorized. Please login.' if current_user.nil?
  end
end
