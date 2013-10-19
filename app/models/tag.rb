class Tag < ActiveRecord::Base
  has_many :thread_tag
  has_many :athread, :through => :thread_tag

end
