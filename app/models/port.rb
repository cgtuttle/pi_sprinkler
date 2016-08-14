class Port < ActiveRecord::Base
	has_one :station, dependent: :destroy
	has_many :program_stations, through: :station

end
