module ApplicationHelper
	
	# Returns "No Title" if no provided title, else use provided title.
	def full_title(page_title)
		base_title = "No Title"
		if page_title.empty?
			base_title
		else
			"#{page_title}"
		end
	end
	
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
  
end
