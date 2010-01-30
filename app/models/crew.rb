class Crew < ActiveRecord::Base
  belongs_to :landesverband
  has_many :nodes
  has_many :scores, :through => :nodes
end
