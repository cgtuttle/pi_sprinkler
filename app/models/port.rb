class Port < ActiveRecord::Base
	belongs_to :station, dependent: :destroy

end
