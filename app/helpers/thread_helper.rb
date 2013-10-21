module ThreadHelper

	def author(u_id)
    user = User.where(id: u_id)
	by = user[0].username
  end
  

  def not_following?(u_id, second_u_id)
    @following = FollowThread.where(user_id: @u_id, athread_id: second_u_id)
	if @following.empty?
	  true
	else 
	  false
	end
  end
end
