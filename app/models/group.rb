class Group < ActiveRecord::Base
  belongs_to :province
	has_many :users
end
