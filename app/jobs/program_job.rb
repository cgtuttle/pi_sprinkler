class ProgramJob
  include SuckerPunch::Job

  def perform(program)
  	while true do
  		puts "monitoring schedule"
  		if (program.start_at >= Time.now) && (program.last_run_on < program.start_at)
  			program.last_run_on = program.start_at
  			program.save
  			StationJob.perform(program)
  		end
  		sleep 1
  	end
  end

end