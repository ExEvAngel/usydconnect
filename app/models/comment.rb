class Comment < ActiveRecord::Base
  belongs_to :user
  has_many :post
  has_one :athread, :through => :post
end
