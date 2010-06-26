class Province < ActiveRecord::Base
  belongs_to :country
  has_many :locations
  has_many :users, :through => :locations, :foreign_key => 'id'
  has_many :nodes, :through => :users, :foreign_key => 'id'
  has_many :scores, :through => :nodes, :foreign_key => 'id'
end
