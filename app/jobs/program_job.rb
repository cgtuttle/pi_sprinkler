class ProgramJob
  include SuckerPunch::Job

  def perform(program)
  	while true do
  		if (program.start_at >= Time.now) && (program.last_run_on < program.start_at)
  			program.last_run_on = program.start_at
  			program.save
  			StationJob.perform(program)
  		end
  	end
  end

end