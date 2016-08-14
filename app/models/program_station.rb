class ProgramStation < ActiveRecord::Base
  belongs_to :program
  belongs_to :station
  belongs_to :port

  def start_at
  	program = self.program
  	start = program.start_at
    start + (program.program_stations.where("sequence < (?)", self.sequence).sum(:duration) * 60)
  end

  def stop_at
    self.start_at + (self.duration * 60)
  end

end
