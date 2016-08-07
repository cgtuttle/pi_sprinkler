class Pin
	attr_accessor :gpio

	def initialize(gpio, direction = "out")
		self.gpio = gpio
		cmd = "gpio export #{gpio} #{direction}"
		system(cmd)
	end

	def value(val)
		cmd = "echo #{val} > /sys/class/gpio/#{self.gpio}/value"
		system(cmd)
	end

	def close
		cmd = "gpio unexport #{self.gpio}"
		system(cmd)
	end

end