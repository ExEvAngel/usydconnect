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
end
