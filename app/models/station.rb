class Station < ActiveRecord::Base
  has_many :program_stations, dependent: :destroy
  has_many :programs, through: :program_stations
  has_one :port

  def add_to_programs
  	Program.all.each do |program|
  		self.program_stations.create(program_id: program.id, duration: self.duration, sequence: self.sequence)
  	end
  end

  def run

  end

  def stop
  end

end
