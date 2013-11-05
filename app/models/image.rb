class Image < ActiveRecord::Base
  validates_presence_of :title
  validates :url, presence: true, uniqueness: true
end
