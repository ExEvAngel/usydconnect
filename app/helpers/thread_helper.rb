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
  
  def not_liked?(u_id, post_id, type)
    @liked = Like.where(user_id: @u_id, apost_id: post_id, apost_type: type)
	if @liked.empty?
	  true
	else 
	  false
	end
  end
  
  def not_flagged?(u_id, post_id, type)
    @flagged = Flag.where(user_id: @u_id, apost_id: post_id, apost_type: type)
	if @flagged.empty?
	  true
	else 
	  false
	end
  end
  
  def comment_no_likes(c_id)
    @likes = Like.where(apost_id: c_id, apost_type: 'comment').count
  end

  def is_threadowner?(thread_id)
  	username = cookies.signed[:username]
    if User.exists?(username: @username)
    	user = User.where(username: username)
    	userid = user[0].id

    	thread = Athread.where(id: thread_id)
    	uid =thread[0].user_id

    	if userid == uid
    		true
    	else
			false
    	end
    else
      false
    end
  end
  
  def is_commentowner?(comment_id)
  	username = cookies.signed[:username]
    if User.exists?(username: @username)
    	user = User.where(username: username)
    	userid = user[0].id

    	comment = Comment.where(id: comment_id)
    	uid = comment[0].user_id

    	if userid == uid
    		true
    	else
			false
    	end
    else
      false
    end
  end

  def is_mod?
    username = cookies.signed[:username]
    if User.exists?(username: username)
      user = User.where(username: username)
      userid = user[0].id
      if Moderators.exists?(user_id: userid)
        true
      else
        false
      end
    else
      false
    end
  end
  
end
