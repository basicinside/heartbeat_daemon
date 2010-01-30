class Node < ActiveRecord::Base
  belongs_to :landesverband
  belongs_to :partei
  belongs_to :crew
  has_many :scores, :dependent => :destroy
end
