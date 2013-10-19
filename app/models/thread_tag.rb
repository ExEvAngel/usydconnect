class ThreadTag < ActiveRecord::Base
  belongs_to :athread
  belongs_to :tag
  
end
