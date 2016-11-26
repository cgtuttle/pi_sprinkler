class StationJob
  include SuckerPunch::Job
  require 'pin'

  def perform(program)
    puts "Calling connect"
    connect(program)
  	while $system_status != "off"
      puts "Running StationJob - $system_status = #{$system_status}"
  		program.program_stations.each do |ps|
        pin = Pin.find(ps.port)
        pin.value(ps.station.id == $current_station ? 0 : 1)
        sleep 1
  		end
  	end
    puts "Calling disconnect"
    disconnect(program)
	end

  def connect(program)
    puts "===============CONNECTING=================="
    program.program_stations.each do |ps|
      if not pin = Pin.find(ps.port)
        pin = Pin.new(ps.port)
      else
        pin.value(1)
      end
    end
  end

  def disconnect(program)
    puts "==============DISCONNECTING================"
    puts "#{Pin.count} Pins"
    program.program_stations.each do |ps|
      Pin.all.each do |pin|
        if ps.port.port_number == pin.port.port_number
          puts "Disconnecting pin #{pin.port.port_number}"
          pin.disconnect
          pin = nil
        end
      end
    end
    puts "#{Pin.count} Pins"
  end

end
