class StaticPagesController < ApplicationController
  before_action :get_username
  before_filter :authorize, :only => [:follow]

  def create
	if valid_login(params[:username], params[:password])
    if !banned_user?(params[:username])
	  create_cookies(params[:username], params[:password])
    redirect_to root_path
    else
      redirect_to root_path, notice: 'Banned User!'
    end
  else 
    redirect_to root_path, notice: 'Invalid login or password!'
	end
    
  end
  
  def destroy
  	sign_out
  	redirect_to root_path
  end
  
  def home
    @recent = Athread.last(6)
	@pinned = Athread.first(2)
  end

  def help
  end


  def about
  end

  def policy
  end
  
  # to display search results
  def results
  
  if params[:tag][:id].empty?
    params[:tag][:id] = nil
  end
  
  if params[:unitcode][:id].empty?
    params[:unitcode][:id] = nil
  end
  
  if params[:thread][:posted_after].empty?
    params[:thread][:posted_after] = nil
  end
  
  @threads = Athread.search(params[:search], params[:tag][:id], params[:unitcode][:id], params[:thread][:posted_after])
  
  end
	
  # to display the follow page
  def follow
    
    @followu = FollowUser.where(user_id: @u_id)
    @followt = FollowThread.where(user_id: @u_id)
  end 

  #submit follow thread request
  def ft
      @follow = FollowThread.new(:user_id => @u_id, :athread_id => params[:id])
	  if @follow.save
		redirect_to follow_path
	  end
  end

  #submit unfollow thread request
  def uft
     @follow = FollowThread.where(user_id: @u_id, athread_id: params[:id])
    if @follow[0].destroy
      redirect_to follow_path
    end
  end

  #submit follow user request
  def fu
    @follow = FollowUser.new(:user_id => @u_id, :second_user_id => params[:id])
    if @follow.save
      redirect_to follow_path
    end
    @follow = FollowUser.where(user_id: @u_id, second_user_id: params[:id])
    if @follow[0].destroy
      redirect_to follow_path
    end
  end

  #submit unfollow user request
  def ufu
    
    @follow = FollowUser.where(user_id: @u_id, second_user_id: params[:id])
    if @follow[0].destroy
      redirect_to follow_path
    end
  end
  
  	private
		def get_username
		  if is_logged_in?
		    @username = cookies.signed[:username]
          if User.exists?(username: @username)
		        @u_id = User.get_user_id(@username)
          end

	      end
		end

  def authorize
     unless is_logged_in?
    redirect_to root_path
  end
end
		
end
