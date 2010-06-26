class Album < ActiveRecord::Base
	has_many :photos
  validates_presence_of :name

end
