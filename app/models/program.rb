class Program < ActiveRecord::Base
	has_many :schedules
	has_many :program_rules, dependent: :destroy
	has_many :rules, through: :program_rules
	has_many :program_stations, dependent: :destroy
	has_many :stations, through: :program_stations
	validates :name, presence: true
	accepts_nested_attributes_for :program_stations

	def next_date
		rule_met = false
		time_now = Time.now.seconds_since_midnight.seconds
		date_now = Date.today()
		date_offset = time_now < self.stop_seconds ? 0 : 1
		date_next = date_now + date_offset
		until rule_met || date_next == (date_now + 365) do
			self.rules.each do |rule|
				rule_met = rule.is_valid?(date_next)
				break if rule_met
			end
			date_return = date_next
			date_next += 1
		end
		date_return
	end

	def start_seconds
		self.start_time.seconds_since_midnight.seconds
	end

	def stop_seconds
		self.start_seconds + self.total_duration*60.seconds
	end

	def total_duration
		self.program_stations.sum(:duration)
	end

	def run_now?
		self.next_date == Date.today() && Time.now.seconds_since_midnight.seconds.between?(self.start_seconds, self.stop_seconds)
	end

	def add_stations
		Station.all.each do |station|
			self.program_stations.create(station_id: station.id, duration: station.duration, sequence: station.sequence)
		end
	end

end
