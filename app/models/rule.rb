class Rule < ActiveRecord::Base
	has_many :program_rules, dependent: :destroy
	has_many :programs, through: :program_rules


	def is_valid?(date_now)
		date = date_now.blank? ? Date.today : date_now
		case self.name
		when "even_only"
			date.to_date.mday.even?
		when "odd_only"
			date.to_date.mday.odd?
		when "mon"
			date.to_date.monday?
		when "tue"
			date.to_date.tuesday?
		when "wed"
			date_now.to_date.wednesday?
		when "thu"
			date_now.to_date.thursday?
		when "fri"
			date_now.to_date.friday?
		when "sat"
			date_now.to_date.saturday?
		when "sun"
			date_now.to_date.sunday?
		else
		end
	end

end
