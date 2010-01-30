class Landesverband < ActiveRecord::Base
  belongs_to :partei
  has_many :crews
  has_many :nodes, :through => :crews
  has_many :scores, :through => :nodes
end
