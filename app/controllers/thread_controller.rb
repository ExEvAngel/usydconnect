class ThreadController < ApplicationController
  before_action :get_username

  def new
	redirect_to root_path unless is_logged_in?
	
  end
  
  def create
	redirect_to root_path unless is_logged_in?
	@thread = Athread.new(:title => params[:title], :body => params[:body], :user_id => @u_id, :Date => Time.now)
	@follow = FollowThread.new(:user_id => @u_id, :athread_id => @thread.id)
	if @thread.save && @follow.save
	  # xp increase for creating thread
	  @user = User.where(id: @u_id)
	  xp = @user[0].xp
      @user[0].xp = xp + 5
	  @user[0].save
      redirect_to thread_path(:id => @thread.id)
    else
      redirect_to root_path
    end
  end
  
  def thread
	@thread = Athread.where(id: params[:id])
	@comments = Comment.where(athread_id: params[:id])
	@title = @thread[0].title
	@body = @thread[0].body
	@time = @thread[0].Date
	@user = User.joins(:athread).where(id: @thread[0].user_id)
	@by = @user[0].username
	views = @thread[0].increment(:views)
	views.save
	@views = @thread[0].views
	@likes = Like.where(apost_id: params[:id], apost_type: 'thread').count
  end
  
  def destroy
  	sign_out
  	redirect_to root_path
  end


  def createcomments
	redirect_to root_path unless is_logged_in?
	@comment = Comment.new(:athread_id => params[:at_id], :body => params[:body], :user_id => @u_id, :date => Time.now)

	if @comment.save
	  # xp increase for creating thread
	  @user = User.where(id: @u_id)
	  xp = @user[0].xp
      @user[0].xp = xp + 5
	  @user[0].save
    redirect_to thread_path(:id =>params[:at_id])
    else
      redirect_to root_path
    end
  end

  def unfollow
    @follow = FollowThread.where(user_id: @u_id, athread_id: params[:id])
	if @follow[0].destroy
		redirect_to thread_path(:id => params[:id])
	end
  end
  
  def follow
    @follow = FollowThread.new(:user_id => @u_id, :athread_id => params[:id])
	if @follow.save
		redirect_to thread_path(:id => params[:id])
	end
  end
  
  def unlike
    @like = Like.where(user_id: @u_id, apost_id: params[:post_id], apost_type: params[:type])
	if @like[0].destroy
		redirect_to thread_path(:id => params[:id])
	end
  end
  
  def like
    @like = Like.new(user_id: @u_id, apost_id: params[:post_id], apost_type: params[:type])
	if @like.save
		redirect_to thread_path(:id => params[:id])
	end
  end
  
  def unflag
    @flag = Flag.where(user_id: @u_id, apost_id: params[:post_id], apost_type: params[:type])
	if @flag[0].destroy
		redirect_to thread_path(:id => params[:id])
	end
  end
  
  def flag
    @flag = Flag.new(user_id: @u_id, apost_id: params[:post_id], apost_type: params[:type])
	if @flag.save
		redirect_to thread_path(:id => params[:id])
	end
  end
  
  def destroy
  	sign_out
  	redirect_to root_path
  end

	private
	def get_username
	  if is_logged_in?
		@username = cookies.signed[:username]
		@u_id = User.get_user_id(@username)
	  end
	end
end
