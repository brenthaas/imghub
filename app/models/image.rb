class Image < ActiveRecord::Base
  validates_presence_of :url
  validates_presence_of :title

  validates_uniqueness_of :url
end
