class User < ActiveRecord::Base
  has_many :user_achievement
  has_many :achievement, :through => :user_achievement
  has_many :athread
  has_many :follow_thread
  has_many :following_athread, class_name: 'Threads', :through => :follow_thread
  has_many :follow_user
  has_many :following_user, class_name: 'User', :through => :follow_user
  has_many :follower_user, class_name: 'User', :through => :follow_user
  has_many :comment
  has_one :moderator
  has_one :draft_thread
  
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
