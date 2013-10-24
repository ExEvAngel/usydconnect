module StaticPagesHelper

  def author(u_id)
    user = User.where(id: u_id)
	by = user[0].username
  end

  def membersince(u_id)
    user = User.where(id: u_id)
	by = user[0].created_at
  end
  def xp(u_id)
    user = User.where(id: u_id)
	by = user[0].xp
  end
  def title(athread_id)
    thread = Athread.where(id: athread_id)
	title = thread[0].title
  end

  def postby(athread_id)
  	thread = Athread.where(id: athread_id)
  	uid =thread[0].user_id
    user = User.where(id: uid )
	by = user[0].username
  end

  def threadowner(athread_id)
  	thread = Athread.where(id: athread_id)
    by = thread[0].id
  end

  def threadpost(athread_id)
  	thread = Athread.where(id: athread_id)
    by = thread[0].Date
  end

  def threadview(athread_id)
  	thread = Athread.where(id: athread_id)
    by = thread[0].views
  end
  def threadrep(athread_id)
    thread = Athread.where(id: athread_id)
    uid =thread[0].user_id
    user = User.where(id: uid )
    by = user[0].xp
  end

  def not_already_following?(u_id, second_u_id)
    @following = FollowUser.where(user_id: @u_id, second_user_id: second_u_id)
  if @following.empty?
    true
  else 
    false
  end
  end

  def is_threadowner?(thread_id)
    username = cookies.signed[:username]
    if User.exists?(username: username)
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
