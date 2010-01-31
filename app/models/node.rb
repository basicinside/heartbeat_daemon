class Node < ActiveRecord::Base
  belongs_to :landesverband
  belongs_to :partei
  belongs_to :crew
  has_many :scores, :dependent => :destroy
  
  def score_count
  	Score.sum('score', :conditions => ['node_id = ?', id])
  end
  
  def popup_info
  "<h4><a href='/nodes/#{id}'>#{name}</a></h4>
  Firmware #{rev}<br />
  <a href='/landesverbands/#{landesverband.id}'>Crew #{crew.name}</a><br />
  <a href='/crews/#{crew.id}'>LV #{landesverband.name}</a><br />
 	#{score_count} Punkte"
  end
end
