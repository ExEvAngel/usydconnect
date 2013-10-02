class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Validates credentials to allow access to restricted pages
  def is_logged_in?
  	username = cookies.signed[:username]
  	password = cookies.signed[:pwd]
  	
  	if username.nil? || password.nil?
  		false
  	elsif password.empty? || username.empty? 
  		false
  	else
      true
  	end
  end
  
  def valid_login(user, pass)
	if user = User.where(username: user)
	  true
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
