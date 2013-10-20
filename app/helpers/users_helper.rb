module UsersHelper

  def not_already_following?(u_id, second_u_id)
    @following = FollowUser.where(user_id: @u_id, second_user_id: second_u_id)
	if @following.empty?
	  true
	else 
	  false
	end
  end

end
