class Achievement < ActiveRecord::Base
  has_many :user_achievement
  has_many :user, :through => :user_achievement
  
  validates :name, presence: true
  validates :description, presence: true
  validates :condition, presence: true
end
