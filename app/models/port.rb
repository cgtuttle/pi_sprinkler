class Port < ActiveRecord::Base
	has_one :station, dependent: :destroy

end
