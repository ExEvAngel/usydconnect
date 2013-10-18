class ThreadController < ApplicationController
  before_action :get_username

  def new
	redirect_to root_path unless is_logged_in?
	
  end
  
  def create
	redirect_to root_path unless is_logged_in?
	@thread = Threads.new(:title => params[:title], :body => params[:body], :user_id => User.get_user_id(@username))
	if @thread.save
      redirect_to thread_path(:id => @thread.id)
    else
      redirect_to root_path
    end
  end
  
  def thread
	@thread = Threads.where(id: params[:id])
	@title = @thread[0].title
	@body = @thread[0].body
	@time = @thread[0].Date
	@by = User.get_username(@thread[0].user_id)
  end
  
  def destroy
  	sign_out
  	redirect_to root_path
  end

	private
	def get_username
		@username = cookies.signed[:username]
	end
end
