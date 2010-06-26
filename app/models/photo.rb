class Photo < ActiveRecord::Base
	belongs_to :node
 
  has_attached_file :data,
  :styles => {
    :thumb => "100x100#",
    :large => "640"
  }
 
  validates_attachment_presence :data
  validates_attachment_content_type :data, 
  :content_type => ['image/jpeg', 'image/pjpeg', 
                                   'image/jpg', 'image/png']

def self.destroy_pics(node, photos)
  Photo.find(photos, :conditions => {:node_id => node}).each(&:destroy)
end
end
