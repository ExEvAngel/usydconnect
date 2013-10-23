class Athread < ActiveRecord::Base
  belongs_to :user
  has_many :post
  has_many :comment, :through => :post
  has_many :thread_tag
  has_many :tag, :through => :thread_tag
  has_many :follow_thread
  has_many :thread_follower_user, class_name: 'User' , :through => :follow_thread
  has_many :like, :as => :apost
  has_many :flag, :as => :apost
end
