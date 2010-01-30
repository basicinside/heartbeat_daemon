class Crew < ActiveRecord::Base
  belongs_to :landesverband
  has_many :nodes
end
