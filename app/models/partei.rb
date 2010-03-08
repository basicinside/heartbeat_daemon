class Partei < ActiveRecord::Base
has_many :landesverbands
  has_many :crews, :through => :landesverbands, :foreign_key => 'id'
  has_many :nodes, :through => :crews, :foreign_key => 'id'
  has_many :scores, :through => :nodes, :foreign_key => 'id'
end
