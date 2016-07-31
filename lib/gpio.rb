module Gpio
	require 'pi_piper'
	include PiPiper

	def self.test_method
		pin = PiPiper::Pin.new(:pin => 17, :direction => :out)
		pin.on
		sleep 1
		pin.off
		puts "It Worked!"
	end

	def toggle_pin(pin_number, to_state)
		pin = PiPiper::Pin.new(:pin => pin_number, :direction => :out)
		to_state == "on" ? pin.on :	pin.off
	end

end