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


end
