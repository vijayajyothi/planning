class SessionsController < ApplicationController
  require 'net/ldap'

  # before_filter :verify_user, :only =>["new"] 
  def new
    render :layout=> false
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, :notice => "Logged out!"
  end

  def verify_user
    ldap = Net::LDAP.new :host => "122.166.208.34",
    :port => 389,
    :auth => {
     :method => :simple,
     :username => "cn=admin, dc=ldap, dc=itcubetech, dc=com",
     :password => "ldap123"
   }
   valid_email = params[:user][:user_name] =~ /^[a-zA-Z0-9._-]+@[a-zA-Z0-9-]+\.[a-zA-Z.]{2,5}$/

   if valid_email == 0
    filter = Net::LDAP::Filter.eq("mail", params[:user][:user_name])
    @search = UserInfo.search do
      fulltext params[:user][:user_name] do
        fields(:email)
      end if !params[:user][:user_name].nil?
    end
    @resultt = @search.results
  else
    filter = Net::LDAP::Filter.eq("uid", params[:user][:user_name])
  end


#filter = Net::LDAP::Filter.eq("uid", params[:user][:user_name])
treebase = "dc=ldap, dc=itcubetech, dc=com"


result = ldap.bind_as(
  :base => treebase,
  :filter => filter,
  :password => params[:user][:password]
  )
t = ldap.get_operation_result

if @resultt
  if @resultt.first.brw_personal_info_id
    session[:user] = @resultt.first
    redirect_to "/borrower_dashboard"
  elsif @resultt.first.lnd_personal_info_id
    session[:user] = @resultt.first
    redirect_to "/lender_dashboard"
  end
  
elsif result
  if t.message == "Success"
    session[:user] = params[:user][:user_name]
    ldap_user = LdapUserLog.new(:user_name =>session[:user], :login_time => DateTime.now)
    #raise ldap_user.inspect
    if ldap_user.save
    #  raise ldap_user.inspect
      #session[:ldap_user] = ldap_user
    end
    redirect_to "/"
  else
    redirect_to login_url and return
  end
else
  redirect_to login_url, :flash => { :error => "User Name and Password doesn't exist." }
end



end
end
