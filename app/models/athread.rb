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
  
  def self.search(search, t_id, unit_id, posted_after)
    string = "%" + search + "%"
    @result = Athread.where("title like ?", string)
	if !t_id.nil?
	  @result = @result.where(tag_id: t_id)
	end
	if !unit_id.nil?
	  @result = @result.where(unitcode_id: unit_id)
	end
	if !posted_after.nil?
	  @result = @result.where("Date > ?", posted_after)
	end
	@result
  end
  
end
