class Pin
	require 'pi_piper'
	include PiPiper

	def export(gpio_number, direction)
		# if system("echo #{gpio_number} > /sys/class/gpio/export")
		# 	system("echo \"#{direction}\" > /sys/class/gpio/gpio#{gpio_number}/direction" )
		# end
		pin = PiPiper::Pin.new(:pin => gpio_number, :direction => :direction)
		pin.on
		sleep 1
		pin.off
	end



end