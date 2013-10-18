class User < ActiveRecord::Base
  validates :username, :uniqueness => true, :presence => true
  validates :password, :presence => true
 
  def self.get_user_id(user)
    @user = User.where(username: user)
    @user[0].id
  end
  
  def self.get_username(id)
    @user = User.where(id: id)
    @user[0].username
  end

end
