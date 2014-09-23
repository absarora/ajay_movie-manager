class Collection < ActiveRecord::Base
  has_many :movies

  validates_presence_of :title

  default_scope { order('created_at DESC')}
end
