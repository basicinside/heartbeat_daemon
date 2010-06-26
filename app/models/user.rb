class User < ActiveRecord::Base
	acts_as_authentic do |c|
  	c.openid_required_fields = [:nickname, :email]
	end
	validates_presence_of :username, :role

	has_many :nodes
	belongs_to :group
	belongs_to :location
	has_one :province, :through => :location
	has_one :country, :through => :province
	belongs_to :party
	belongs_to :role
	def score
	n = Node.find(:all,  :select => "SUM(scores.score) AS score",
                :joins =>  :scores, :conditions => ["user_id = ?", self.id], :order => 'SUM(scores.score) DESC')
	score = 0;
	n.each { |node|  score += node.score.to_i }
	score
	end

def role_symbols
	if role.name == "admin"
		[:admin] 
	else
		[:operator] 
	end
end

private

	def map_openid_registration(registration)
  	self.email = registration["email"] if email.blank?
  	self.username = registration["nickname"] if username.blank?
	end

end
