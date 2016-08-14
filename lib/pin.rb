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

	def close
		cmd = "gpio unexport #{self.gpio}"
		system(cmd)
	end

	def self.open_all(ports)
		each do |pin|
			pin_closed = true
			ports.each do |port|
				if pin.gpio == port.gpio
					pin_closed = false
					break
				end
			end
			if pin_closed
				Pin.new(port.gpio, "out")
			end
		end		
	end

	def self.from_gpio(gpio)
		each do |pin|
			if pin.gpio == gpio
				@pin = pin
			end
		end
	end


end