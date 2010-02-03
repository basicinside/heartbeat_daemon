class Node < ActiveRecord::Base

  
  belongs_to :crew
  has_one :landesverband, :through => :crew
	#has_one :partei, :through =>  :landesverband, :foreign_key => 'partei_id'
  has_many :scores, :dependent => :destroy
  
  
  def score_count
  	Score.sum('score', :conditions => ['node_id = ?', id])
  end
  

  
  def popup_info
  "<h4><a href='/nodes/#{id}'>#{name || node_id}</a></h4>
  Firmware #{rev}<br />
  <a href='/landesverbands/#{landesverband.id}'>Crew #{crew.name}</a><br />
  <a href='/crews/#{crew.id}'>LV #{landesverband.name}</a><br />
 	#{score_count} Punkte"
  end
end
