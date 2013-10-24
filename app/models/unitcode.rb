class Unitcode < ActiveRecord::Base
  has_many :thread_unitcode
  has_many :athread, :through => :thread_unitcode
  
end
