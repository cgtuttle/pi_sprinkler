class Station < ActiveRecord::Base
  has_many :program_stations, dependent: :destroy
  has_many :programs, through: :program_stations
  belongs_to :port

  def add_to_programs
  	Program.all.each do |program|
  		self.program_stations.create(program_id: program.id, duration: self.duration, sequence: self.sequence)
  	end
  end

  def start_at(program)
  	delay = program.stations.where("stations.sequence < (?)", self.sequence).sum(:duration).seconds
  	program.start_seconds + delay
  end

  def stop_at(program)
  	self.start_at(program) + self.duration.seconds
  end

end
