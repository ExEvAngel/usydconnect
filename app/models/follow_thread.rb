class FollowThread < ActiveRecord::Base
  belongs_to :user
  belongs_to :athread

end
