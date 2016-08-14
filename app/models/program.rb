class Program < ActiveRecord::Base
	has_many :schedules
	has_many :program_rules, dependent: :destroy
	has_many :rules, through: :program_rules
	has_many :program_stations, dependent: :destroy
	has_many :stations, through: :program_stations
	validates :name, presence: true
	accepts_nested_attributes_for :program_stations

	def next_date
		now = Time.now
		rule_met = false
		date_next = now.to_date + (now < (now.to_date + self.start_time.seconds_since_midnight.seconds + self.total_duration*60) ? 0 : 1)
		until rule_met || date_next == (now.to_date + 365) do
			self.rules.each do |rule|
				rule_met = rule.is_valid?(date_next)
				break if rule_met
			end
			date_return = date_next
			date_next += 1
		end
		date_return
	end

	def start_at
		self.next_date + self.start_time.seconds_since_midnight.seconds
	end

	def stop_at
		self.start_at + self.total_duration * 60
	end

	def total_duration
		self.program_stations.sum(:duration)
	end

	def run_now?(time_now)
		time_now.between?(self.start_at, self.stop_at)
	end

	def add_stations
		Station.all.each do |station|
			self.program_stations.create(station_id: station.id, duration: station.duration, sequence: station.sequence)
		end
	end

end
