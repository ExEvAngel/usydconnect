class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

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
  has_many :like
  has_many :flag
  
 validates :username, uniqueness: { case_sensitive: false },
            presence: true, 
            length: { maximum: 16 }
 validates :password, presence: true, 
            length: { minimum: 6, maximum: 16 }
 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[\w*]+\.?+[sydney]+\.[edu]+\.[au]+\z/i
 validates :email, uniqueness: { case_sensitive: false }, 
            presence: true, 
            format: { with: VALID_EMAIL_REGEX }

  def self.get_user_id(user)
    @user = User.where(username: user)
    @user[0].id

  end
  
  def self.get_username(id)
    @user = User.where(id: id)
    @user[0].username
  end

end
