class Node < ActiveRecord::Base

  has_many :photos
  validates_presence_of :name
  
  belongs_to :user
  has_one :group, :through => :user
	has_one :party, :through => :user
	has_one :location, :through => :user
	has_many :heartbeats, :dependent => :destroy

	#has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }

	has_many :scores, :dependent => :destroy
  
	
  
  def score_count
  	Score.sum('score', :conditions => ['node_id = ?', id])
  end
  

def photo_attributes=(photo_attributes)
  photo_attributes.each do |attributes|
    photos.build(attributes)
  end
end
  
  def popup_info
  	if name != ''
  		"<h4><a href='/nodes/#{id}'>#{name}</a></h4>
  		Firmware #{version}<br />
 			#{score_count} Punkte"
 		else
 		""
 		end
  end
end
