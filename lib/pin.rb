class Pin
	@@array = Array.new
	attr_accessor :gpio, :state, :port

	def initialize(port, direction = "out")
		self.port = port
		self.gpio = port.gpio
		cmd = "gpio export #{gpio} #{direction}"
		puts "sending: #{cmd}"
		system(cmd)
		self.value(1)	
		@@array << self
	end

	def value(val)
		cmd = "echo #{val} > /sys/class/gpio/gpio#{self.gpio}/value"
		puts "sending: #{cmd}"
		system(cmd)
		self.state = val
	end

	def disconnect
		cmd = "gpio unexport #{self.gpio}"
		puts "sending: #{cmd}"
		system(cmd)
		@@array.delete_if { |p| p.port == self.port}
	end

	def self.all
		@@array
	end

	def self.count
		@@array.size
	end

	def self.find(port)
		@@array.each do |pin|
			if pin.port.port_number == port.port_number
				return pin
			end
		end
		nil
	end

end