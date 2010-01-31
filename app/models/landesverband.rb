class Landesverband < ActiveRecord::Base
  belongs_to :partei
  has_many :crews
  has_many :nodes, :through => :crews, :foreign_key => 'id'
  has_many :scores, :through => :nodes, :foreign_key => 'id'
end
