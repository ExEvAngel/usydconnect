class Athread < ActiveRecord::Base
  belongs_to :users
  has_many :post
  has_many :comment, :through => :post
  has_many :thread_tag
  has_many :tags, :through => :thread_tag
  has_many :follow_thread
  has_many :thread_follower_user, class_name: 'User' , :through => :follow_thread
end
