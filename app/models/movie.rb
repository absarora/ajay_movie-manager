class Movie < ActiveRecord::Base
  belongs_to :collection

  validates :title, presence: true, length: {maximum: 50}
  validates :length, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 500 }
  validates :year, presence: true, numericality: { only_integer: true, greater_than: 1800, less_than: 2100 }
  validates_presence_of :format
  validates_presence_of :rating
end
