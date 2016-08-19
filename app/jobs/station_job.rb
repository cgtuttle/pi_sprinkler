class StationJob
  include SuckerPunch::Job
  require 'pin'

  def perform(program, pins)
  	@stations = program.stations
  	while program.run_now?
  		puts "Running stations"
	  	@stations.each do |station|
				gpio = station.port.gpio
				pins.each do |pin|
					if pin.gpio = gpio
		  			pin.value(Time.now().between?(station.start_at, station.stop_at) ? 1 : 0)
		  		end
		  	end
	  	end
	  end
  end


end
