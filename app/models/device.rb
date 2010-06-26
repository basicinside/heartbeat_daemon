class Device < ActiveRecord::Base
	has_many :bugreports
	has_many :nodes

	def bezeichnung
	"#{hersteller} - #{name}"
	end
end
