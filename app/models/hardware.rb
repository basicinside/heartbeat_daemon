class Hardware < ActiveRecord::Base
	has_many :bugreports

	def bezeichnung
	"#{hersteller} - #{name}"
	end
end
