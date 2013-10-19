class Post < ActiveRecord::Base
  belongs_to :athread
  belongs_to :comment
  
end
