class Node < ActiveRecord::Base
  belongs_to :landesverband
  belongs_to :partei
  belongs_to :crew
end
