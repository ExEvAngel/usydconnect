class Comment < ActiveRecord::Base
  belongs_to :user
  has_many :post
  has_one :athread, :through => :post
  has_many :like, :as => :apost
  has_many :flag, :as => :apost
end
