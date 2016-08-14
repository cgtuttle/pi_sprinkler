class ProgramJob
  include SuckerPunch::Job

  def perform(program)
  	$is_running = true
  	last_run = program.last_run_on || Date.new(1900,1,1)
  	next_run = program.next_date + program.start_seconds
  	while $is_running do
  		puts "last_run_on = #{program.last_run_on}, next_run = #{next_run}, run_now? = #{program.run_now?}"
  		if (program.run_now?) && (program.last_run_on < next_run)
  			puts "Initiating StationJob"
  			program.last_run_on = next_run
  			program.save
  			StationJob.perform_async(program)
  		end
  		sleep 1
  	end
  end

end