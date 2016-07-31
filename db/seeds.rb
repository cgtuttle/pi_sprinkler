# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Port.create(pin_id: 11, port_number: 1, gpio: "GPIO17")
Port.create(pin_id: 12, port_number: 2, gpio: "GPIO18")
Port.create(pin_id: 13, port_number: 3, gpio: "GPIO27")
Port.create(pin_id: 15, port_number: 4, gpio: "GPIO22")
Port.create(pin_id: 16, port_number: 5, gpio: "GPIO23")
Port.create(pin_id: 18, port_number: 6, gpio: "GPIO24")
Port.create(pin_id: 22, port_number: 7, gpio: "GPIO25")
Port.create(pin_id: 29, port_number: 8, gpio: "GPIO05")
Port.create(pin_id: 31, port_number: 9, gpio: "GPIO06")
Port.create(pin_id: 32, port_number: 10, gpio: "GPIO12")

Port.all.each do |port|
	port.station.create(number: :port_number, duration: "30")
end
