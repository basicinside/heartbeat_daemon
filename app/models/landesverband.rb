class Landesverband < ActiveRecord::Base
  belongs_to :partei
  has_many :crews
end
