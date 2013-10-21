class UsersController < ApplicationController
  before_action :get_username
	
  def create
    @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
    if @user.save
	  create_cookies(params[:username], params[:password])
      redirect_to root_path
    else
      redirect_to signup_path
    end
  end
  
  def new
    redirect_to root_path unless !is_logged_in?
  end
  
  def profile
    @user = User.where(id: params[:id])
	@name = @user[0].username
	@member_since = @user[0].member_since
	@email = @user[0].email
	@xp = @user[0].xp
  end
  
  def unfollow
    @follow = FollowUser.where(user_id: @u_id, second_user_id: params[:id])
	if @follow[0].destroy
		redirect_to profile_path(:id => params[:id])
	end
  end
  
  def follow
    @follow = FollowUser.new(:user_id => @u_id, :second_user_id => params[:id])
	if @follow.save
		redirect_to profile_path(:id => params[:id])
	end
  end
  
	private
	def get_username
	  if is_logged_in?
		@username = cookies.signed[:username]
		@u_id = User.get_user_id(@username)
	  end
	end
end
