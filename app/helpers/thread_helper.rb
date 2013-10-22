module ThreadHelper

	def author(u_id)
    user = User.where(id: u_id)
	by = user[0].username
  end
  

  def not_following?(u_id, thread_id)
    @following = FollowThread.where(user_id: @u_id, athread_id: thread_id)
	if @following.empty?
	  true
	else 
	  false
	end
  end
end
