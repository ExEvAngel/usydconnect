class Achievement < ActiveRecord::Base
  has_many :user_achievement
  has_many :user, :through => :user_achievement
  
end
