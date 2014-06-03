class UsersController < ApplicationController
  def new
    @user = User.new
    render :layout => false
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      cookies[:auth_token] = @user.auth_token
      redirect_to root_url, :flash => {:notice=>"Successfully logged in! "}
    else
      render "new"
    end
  end

end
