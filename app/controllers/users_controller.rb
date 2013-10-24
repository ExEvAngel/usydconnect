class UsersController < ApplicationController
	before_action :get_username

	def create
		if params[:username].blank? || params[:username].blank? || params[:email].blank?  || params[:password].blank? || params[:verifypassword].blank?  
		redirect_to signup_path, notice: 'Please fill in all the required fields'
		else
		
			if !User.exists?(username: params[:username])
				if  params[:password] == params[:verifypassword]
					if !User.exists?(email: params[:email])
						@user = User.new(:username => params[:username], :email => params[:email], :password => params[:password], :member_since => Time.now)
						if @user.save
							create_cookies(params[:username], params[:password])
							redirect_to root_path
						else
							redirect_to signup_path
						end
					else
						redirect_to signup_path, notice: 'registration is limited per 1 student email acount'
					end
				else
					redirect_to signup_path, notice: 'Password doesnt match, retype password'
				end
			else
				redirect_to signup_path, notice: 'Username is taken'
			end
		end
	end

	def new
		redirect_to root_path unless !is_logged_in?
	end

	def profile
		if User.exists?(id: params[:id])
			@user = User.where(id: params[:id])
			@name = @user[0].username
			@member_since = @user[0].member_since
			@email = @user[0].email
			@xp = @user[0].xp
			@answercount = @user[0].no_comment
			@postcount = @user[0].no_thread
		else
			redirect_to root_path
		end
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

	def ban
		@user = User.find(params[:id])
		@user.update_attributes(:is_banned => true)
		redirect_to profile_path(:id => params[:id])
	end

	def unban
		user = User.find(params[:id])
		user.update_attributes(:is_banned => false)
		redirect_to profile_path(:id => params[:id])
	end


	def change_password
		if params[:oldpassword].blank? || params[:newpassword].blank? || params[:verifypassword].blank?  
		redirect_to signup_path, notice: 'Please fill in all the required fields'
		else
			@username = cookies.signed[:username]
			if !User.exists?(username: params[:username])
				user = User.find(params[:id])				
				if (user.password).eql? params[:oldpassword]
					if  params[:newpassword] == params[:verifypassword]
						if user.update_attributes(password: params[:newpassword])
							cookies.delete(:pwd)
							cookies.signed[:pwd] = {
					 		value: params[:newpassword],
					 		expires: 1.weeks.from_now }
							redirect_to profile_path(:id => params[:id]), notice: 'Password successfuly changed'
						else
							redirect_to profile_path(:id => params[:id]), notice: 'Was unable to change password'
						end
					else
						redirect_to profile_path(:id => params[:id]), notice: 'Password doesnt match'
					end
				else
					redirect_to profile_path(:id => params[:id]), notice: 'Incorrect Password'
				end
			else
					redirect_to profile_path(:id => params[:id]), notice: 'userdoesntexist'
			end
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
end
