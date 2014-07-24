class SessionsController < ApplicationController
  require 'net/ldap'

  before_filter :verify_user, :only =>["create"] 
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

  def  verify_user
  check = name_for_login(params[:email], params[:password])
  raise check.inspect
  end

  def name_for_login( email, password )
  email = email[/\A\w+/].downcase  # Throw out the domain, if it was there
  email << "@vmware.com"        # I only check people in my company
  ldap = Net::LDAP.new :host => "10.128.153.110",
    :port => 389,
    :base => "DC=vmware,DC=com",
    :auth => {
     :method => :simple,
     :username => "#{email}",
     :password => password
   }
  # ldap = Net::LDAP.new(
  #   host: '10.128.153.110',    # wdcrootdc03.vmware.com
  #   port: '389',

  #   auth: { method: :simple, username: email, password:password }
  #   )
  raise "here"
  if ldap.bind
    # Yay, the login credentials were valid!
    # Get the user's full name and return it
    ldap.search(
      base:         "CN=sc.opsgps-stg,OU=Generic,OU=SeriveAccounts,OU=Corp,OU=Common,DC=vmware,DC=com",
      filter:       Net::LDAP::Filter.eq( "mail", email ),
      attributes:   %w[ displayName ],
      return_result:true
      ).first.displayName.first
  end
end
end
