class StationJob
  include SuckerPunch::Job
  require 'pin'

  def perform(program, pins)
  	@stations = program.program_stations
  	while program.run_now? && $is_running?
  		puts "Running stations"
	  	@stations.each do |program_station|
				gpio = program_station.station.port.gpio
				pins.each do |pin|
					if pin.gpio == gpio
		  			pin.value(Time.now().seconds_since_midnight.seconds.between?(program_station.start_at, program_station.stop_at) ? 1 : 0)
		  		end
		  	end
		  	sleep 1
	  	end
	  end
  end


end
