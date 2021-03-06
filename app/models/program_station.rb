class ProgramStation < ActiveRecord::Base
  belongs_to :program
  belongs_to :station
  has_one :port, through: :station

  def start_at
  	program = self.program
  	start = program.start_seconds
    start + (program.program_stations.where("sequence < (?)", self.sequence).sum(:duration) * 60)
  end

  def stop_at
    self.start_at + (self.duration * 60)
  end

  def run_now?
    Time.now().seconds_since_midnight.seconds.between?(self.start_at, self.stop_at)
  end

end
