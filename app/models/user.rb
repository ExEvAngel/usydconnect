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
  
 # validates :terms_of_service, acceptance: { accept: 'yes' } 
 validates :username, uniqueness: { case_sensitive: false },
            presence: true, 
            length: { minimum: 1, too_short: "Username must be at least %{count} characters" }
 validates :username, length: {maximum: 16, too_long: "Username cannot exceed %{count} characters" }
 validates :password, presence: true
 validates :password, length: { minimum: 6,  too_short: "Password must be at least %{count} characters" }
 validates :password, length: { maximum: 16, too_long: "Password cannot exceed %{count} characters" }
 #validates :password_confirmation, confirmation: true, presence: true
 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[\w*]+\.?+[sydney]+\.[edu]+\.[au]+\z/i
 validates :email, uniqueness: { case_sensitive: false }, 
            presence: true, 
            format: { with: VALID_EMAIL_REGEX, message: "Your email address must be a valid Sydney University email." }

  def self.get_user_id(user)
    @user = User.where(username: user)
    @user[0].id

  end
  
  def self.get_username(id)
    @user = User.where(id: id)
    @user[0].username
  end

end
