class ProgramStation < ActiveRecord::Base
  belongs_to :program
  belongs_to :station
  belongs_to :port

  def start_time
  	program = self.program
  	start = program.start_time
    start + (program.program_stations.where("sequence < (?)", self.sequence).sum(:duration) * 60)
  end

  def stop_time
    self.start_time + (self.duration * 60)
  end

end
