class StaticPagesController < ApplicationController
  before_action :get_username
  before_filter :authorize, :only => [:follow]

  def create
	if valid_login(params[:username], params[:password])
	  create_cookies(params[:username], params[:password])
    redirect_to root_path
  else 
    redirect_to root_path, notice: 'Invalid login or password!'
	end
    
  end
  
  def destroy
  	sign_out
  	redirect_to root_path
  end
  
  def home
    @recent = Athread.last(3)
	@pinned = Athread.first(2)
  end

  def help
  end


  def about
  end

  def policy
  end
  
  def results
  
  @threads = Athread.all
  
  end

  def follow
    
    @followu = FollowUser.where(user_id: @u_id)
    @followt = FollowThread.where(user_id: @u_id)
  end 

  def ft
      @follow = FollowThread.new(:user_id => @u_id, :athread_id => params[:id])
  if @follow.save
    redirect_to follow_path
  end
  end

  def uft
     @follow = FollowThread.where(user_id: @u_id, athread_id: params[:id])
    if @follow[0].destroy
      redirect_to follow_path
    end
  end

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
		    @u_id = User.get_user_id(@username)
	      end
		end

  def authorize
     unless is_logged_in?
    redirect_to root_path
  end
end
		
end
