class ProgramJob
  include SuckerPunch::Job
  require 'pin'

  def perform(program)
  	$is_running = true
    session[:program_status] = "Waiting"
  	last_run = program.last_run_on || Date.new(1900,1,1)
  	next_run = program.next_date + program.start_seconds
  	pins(program, "connect")
  	while $is_running do
  		puts "last_run_on = #{program.last_run_on}, next_run = #{next_run}, run_now? = #{program.run_now?}"
  		if (program.run_now?) && (program.last_run_on <= next_run)
  			puts "Initiating StationJob"
  			program.last_run_on = next_run
  			program.save
  			StationJob.perform_async(program, @pin)
  		end
  		sleep 1
  	end
  	pins(program, "disconnect")
  end

  def pins(program, action)
  	@pin = Array.new
  	program.stations.each do |station|
  		port = station.port
  		i = port.port_number - 1
  		if @pin[i]
  			@pin[i].disconnect
  			@pin[i].close
  		end
  		if action == "connect"
  			@pin[i] = Pin.new(port.gpio)
  			@pin[i].value(1)
  		end
  	end
  end


end