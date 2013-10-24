class ThreadController < ApplicationController
  before_action :get_username

  def new
	redirect_to root_path unless is_logged_in?
	@draft = DraftThread.where(:user_id => @u_id)
	if !@draft[0].nil?
	  @title = @draft[0].title
	  @body = @draft[0].body
	end
  end
  
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
			  @thread = Athread.new(:title => params[:title], :body => params[:body], :user_id => @u_id, :Date => Time.now)
			  if @thread.save
			    # xp increase for creating thread
		  	    @user = User.where(id: @u_id)
		  	    xp = @user[0].xp
		        @user[0].xp = xp + 5
		  	    @user[0].save
		        redirect_to thread_path(:id => @thread.id)
		      else
		        redirect_to thread_new_path
		      end
		end
	end
  end
  
  def thread
  	if Athread.exists?(id: params[:id])
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
		@closed = @thread[0].is_closed
		@likes = Like.where(apost_id: params[:id], apost_type: 'thread').count
	else
		redirect_to root_path
	end
  end

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
	      @user[0].xp = xp + 5
		  @user[0].save
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
