module UsersHelper

  def not_already_following?(u_id, second_u_id)
    @following = FollowUser.where(user_id: @u_id, second_user_id: second_u_id)
	if @following.empty?
	  true
	else 
	  false
	end
  end

  	def is_mod?
	    username = cookies.signed[:username]
	    if User.exists?(username: username)
	      user = User.where(username: username)
	      userid = user[0].id
	      if Moderator.exists?(user_id: userid)
	        true
	      else
	        false
	      end
	    else
	      false
	    end
  	end

  	def banned?(u_id)
	    if User.exists?(id: u_id)
	      user = User.find(u_id)
	      result = user.is_banned
	    else
	      false
	    end
  	end
	
	def get_achievement(a_id)
		@achievements = Achievement.where(id: a_id)
		achievement = @achievements[0]
	end
end
