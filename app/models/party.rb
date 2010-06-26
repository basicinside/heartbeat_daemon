class Party < ActiveRecord::Base
	has_many :users
  has_many :nodes, :through => :users, :foreign_key => 'id'
  has_many :scores, :through => :nodes, :foreign_key => 'id'
end
