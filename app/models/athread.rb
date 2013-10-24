class Athread < ActiveRecord::Base
  belongs_to :user
  has_many :post
  has_many :comment, :through => :post
  belongs_to :tag
  belongs_to :unitcode
  has_many :follow_thread
  has_many :thread_follower_user, class_name: 'User' , :through => :follow_thread
  has_many :like, :as => :apost
  has_many :flag, :as => :apost
  
  def self.search(tag_id, unitcode_id, date_posted)
    
  
  end
  
end
