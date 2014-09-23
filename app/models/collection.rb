class Collection < ActiveRecord::Base
  has_many :movies
  belongs_to :user

  validates_presence_of :title

  default_scope { order('created_at DESC')}
end
