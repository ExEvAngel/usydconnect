class User < ActiveRecord::Base
  validates :username, :uniqueness => true, :presence => true
  validates :password, :presence => true
 
  def self.get_user_id(user)
    @user = User.where(username: user)
  	if !@user.empty?
      1
	end
  end

end
