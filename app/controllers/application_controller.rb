class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Validates credentials to allow access to restricted pages
  def is_logged_in?
  	username = cookies.signed[:username]
  	password = cookies.signed[:pwd]
  	if User.exists?(username: username)
    	if username.nil? || password.nil?
    		false
    	elsif password.empty? || username.empty? 
    		false
    	else
        true
    	end
    else
      false
    end
  end
  
  def valid_login(user, pass)
    @user = User.where(username: user)
  	if !@user.empty?
      if (@user[0].password).eql? pass
        true
      else
        false
      end
  	else
  	  false
  	end
  end

  def banned_user?(username)
      if User.exists?(username: username)
        user = User.where(:username => username)
        result = user[0].is_banned
      else
        false
      end
    end

	# Creates signed user cookies
	def create_cookies(username, password)
		cookies.signed[:username] = { 
	 		value: username,
	 		expires: 1.weeks.from_now }
	 	cookies.signed[:pwd] = {
	 		value: password,
	 		expires: 1.weeks.from_now }
	end

  # Destroy cookies
	def sign_out
		cookies.delete(:username)
		cookies.delete(:pwd)
	end
end
