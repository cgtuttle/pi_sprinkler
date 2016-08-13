class ProgramStation < ActiveRecord::Base
  belongs_to :program
  belongs_to :station
  attr_accessor :start_time

  def start
  	puts "ProgramStation = #{self.inspect}"
  	program = self.program
  	self.start_time = program.start_time
  	puts "Program start time = #{program.start_time}"
  	puts "ProgramStation start time = #{self.start_time}"
  	program.program_stations.order(:sequence).each do |station|
 			puts "Station = #{station.inspect}"
  		break if station.id == self.station.id
  		self.start_time += (station.duration * 60)
  		puts "New start time = #{self.start_time}"
  	end
  	@start_time = self.start_time
  end

end
