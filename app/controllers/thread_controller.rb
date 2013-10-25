class ThreadController < ApplicationController
  before_action :get_username

  # new thread page loads draft thread if there is one
  def new
	redirect_to root_path unless is_logged_in?
	@draft = DraftThread.where(:user_id => @u_id)
	if !@draft[0].nil?
	  @title = @draft[0].title
	  @body = @draft[0].body
	end
  end
  
  # destorys draft thread and create the thread which is posted
  def create
	redirect_to root_path unless is_logged_in?
	@draft = DraftThread.where(:user_id => @u_id)
	if !@draft[0].nil?
	  @draft[0].destroy
	end

	if params[:commit].eql? "Save"
	  @draft = DraftThread.new(:title => params[:title], :body => params[:body], :user_id => @u_id, :saved_at => Time.now)
	  if @draft.save
        redirect_to root_path
      else
        redirect_to thread_new_path
      end
	else
		if params[:title].blank? || params[:body].blank?
		redirect_to thread_new_path, notice: 'Please fill in the Title and Text body'
		else
			  @thread = Athread.new(:title => params[:title], :body => params[:body], :user_id => @u_id, :tag_id => params[:tag][:id], :unitcode_id => params[:unitcode][:id],:Date => Time.now)
			  if @thread.save
			    # xp increase for creating thread
		  	    @user = User.where(id: @u_id)
		  	    xp = @user[0].xp
		        @user[0].xp = xp + 5
		  	    @user[0].save
				#increments number of threads the user has created
				no_thread = @user[0].increment(:no_thread)
			    no_thread.save
		        redirect_to thread_path(:id => @thread.id)
		      else
		        redirect_to thread_new_path
		      end
		end
	end
  end
  
  # retrieve thread information to be displayed
  def thread
  	if Athread.exists?(id: params[:id])
		@thread = Athread.where(id: params[:id])
		@comments = Comment.where(athread_id: params[:id])
		@title = @thread[0].title
		@body = @thread[0].body
		@time = @thread[0].Date
		@user = User.joins(:athread).where(id: @thread[0].user_id)
		@by = @user[0].username
		@closed = @thread[0].is_closed
		@likes = Like.where(apost_id: params[:id], apost_type: 'thread').count
        @tag = Tag.where(id: @thread[0].tag_id)
	    @unitcode = Unitcode.where(id: @thread[0].unitcode_id)
		if params[:action] != 1
			views = @thread[0].increment(:views)
			views.save
		end
		@views = @thread[0].views
	else
		redirect_to root_path
	end
	
  end

  # closes a thread
  def close
  		@thread = Athread.where(id: params[:id])
  		if !@thread[0].is_closed
  		@thread[0].is_closed = true
  		@thread[0].save
  		end
  		redirect_to thread_path(:id => @thread[0].id)
  end
  
  def destroy
  	sign_out
  	redirect_to root_path
  end


  def createcomments
	redirect_to root_path unless is_logged_in?


	if !params[:body].blank?
		@comment = Comment.new(:athread_id => params[:at_id], :body => params[:body], :user_id => @u_id, :date => Time.now)

		if @comment.save
		  # xp increase for creating thread
		  @user = User.where(id: @u_id)
		  xp = @user[0].xp
	      @user[0].xp = xp + 3
		  @user[0].save
		  #increment users number of comments
		  no_comment = @user[0].increment(:no_comment)
		  no_comment.save
	    redirect_to thread_path(:id =>params[:at_id])
	    else
	      redirect_to root_path
	    end
	else
		redirect_to thread_path(:id =>params[:at_id])
	end
  end

  def unfollow
    @follow = FollowThread.where(user_id: @u_id, athread_id: params[:id])
	if @follow[0].destroy
		redirect_to thread_path(:id => params[:id], :action => 1)
	end
  end
  
  def follow
    @follow = FollowThread.new(:user_id => @u_id, :athread_id => params[:id])
	if @follow.save
		redirect_to thread_path(:id => params[:id], :action => 1)
	end
  end
  
  def unlike
    @like = Like.where(user_id: @u_id, apost_id: params[:post_id], apost_type: params[:type])
	if @like[0].destroy
		# decrement number of likes
		if params[:type].eql? "thread"
			@thread = Athread.where(id: params[:post_id])
			@user = User.where(id: @thread[0].id)
			like = @user[0].decrement(:xp)
			like.save
		else
			@comment = Comment.where(id: params[:post_id])
			@user = User.where(id: @comment[0].id)
			like = @user[0].decrement(:xp)
			like.save
		end
		redirect_to thread_path(:id => params[:id], :action => 1)
	end
  end
  
  def like
    @like = Like.new(user_id: @u_id, apost_id: params[:post_id], apost_type: params[:type])
	if @like.save
		# increment number of likes
		if params[:type].eql? "thread"
			@thread = Athread.where(id: params[:post_id])
			@user = User.where(id: @thread[0].id)
			like = @user[0].increment(:xp)
			like.save
		else
			@comment = Comment.where(id: params[:post_id])
			@user = User.where(id: @comment[0].id)
			like = @user[0].increment(:xp)
			like.save
		end
		redirect_to thread_path(:id => params[:id], :action => 1)
	end
  end
  
  def unflag
    @flag = Flag.where(user_id: @u_id, apost_id: params[:post_id], apost_type: params[:type])
	if @flag[0].destroy
		redirect_to thread_path(:id => params[:id], :action => 1)
	end
  end
  
  def flag
    @flag = Flag.new(user_id: @u_id, apost_id: params[:post_id], apost_type: params[:type])
	if @flag.save
		redirect_to thread_path(:id => params[:id], :action => 1)
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
