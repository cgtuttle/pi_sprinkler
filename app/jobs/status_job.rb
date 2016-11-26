class StatusJob
	include SuckerPunch::Job

	def perform(program)
		puts "Running StatusJob.perform for program #{program.name}"
		while $system_status != "off" do			
			if program.run_now?
				$system_status = "run"
				set_station_status(program)
			end
			sleep 1
		end
	end

	def set_station_status(program)
		program.program_stations.each do |ps|
			if ps.run_now?
				$current_station = ps.station.id
				puts "current station = #{$current_station}"
			end
		end
	end
end