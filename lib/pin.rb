class Pin

	def initialize(gpio, direction = "out")
		system("gpio export 17 out")
		`echo "1" > /sys/class/gpio/gpio17/value`
		sleep 1
		`echo "0" > /sys/class/gpio/gpio17/value`
		`gpio unexport 17`
	end



end