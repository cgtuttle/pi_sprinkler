class Pin
	attr_accessor :gpio, :state

	def initialize(gpio, direction = "out")
		self.gpio = gpio
		cmd = "gpio export #{gpio} #{direction}"
		puts cmd
		system(cmd)
	end

	def value(val)
		cmd = "echo #{val} > /sys/class/gpio/gpio#{self.gpio}/value"
		puts cmd
		system(cmd)
		self.state = val
	end

	def disconnect
		cmd = "gpio unexport #{self.gpio}"
		system(cmd)
	end

end