class ProgramJob
  include SuckerPunch::Job

  def perform(program)
  	while true do
  		if program.start_time >= Time.now & program.last_run_on < program.start_time
  			program.last_run_on = program.start_time
  			program.save
  			StationJob.perform(program)
  		end
  	end
  end

end