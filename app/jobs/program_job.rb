class ProgramJob
  include SuckerPunch::Job

  def perform(program)
  	$is_running = true
  	last_run = program.last_run_on || Date.new(1900,1,1)
  	start_at = program.start_at
  	while $is_running do
  		puts "is_runing = #{$is_running}"
  		if (start_at >= Time.now) && (last_run < start_at)
  			program.last_run_on = start_at
  			program.save
  			StationJob.perform_async(program)
  		end
  		sleep 1
  	end
  end

end