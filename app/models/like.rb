class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :apost, polymorphic: true
end
