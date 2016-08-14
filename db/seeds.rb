# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Port.create(pin_id: 11, port_number: 1, gpio: "17")
Port.create(pin_id: 12, port_number: 2, gpio: "18")
Port.create(pin_id: 13, port_number: 3, gpio: "27")
Port.create(pin_id: 15, port_number: 4, gpio: "22")
Port.create(pin_id: 16, port_number: 5, gpio: "23")
Port.create(pin_id: 18, port_number: 6, gpio: "24")
Port.create(pin_id: 22, port_number: 7, gpio: "25")
Port.create(pin_id: 29, port_number: 8, gpio: "5")
Port.create(pin_id: 31, port_number: 9, gpio: "6")
Port.create(pin_id: 32, port_number: 10, gpio: "12")

Port.all.each do |port|
	port.create_station(number: port.port_number, duration: "30")
end

Rule.create(name: "even_only", group: "even_odd", exclusive: TRUE)
Rule.create(name: "odd_only", group: "even_odd", exclusive: TRUE)
Rule.create(name: "mon", group: "days_of_week", exclusive: FALSE)
Rule.create(name: "tue", group: "days_of_week", exclusive: FALSE)
Rule.create(name: "wed", group: "days_of_week", exclusive: FALSE)
Rule.create(name: "thu", group: "days_of_week", exclusive: FALSE)
Rule.create(name: "fri", group: "days_of_week", exclusive: FALSE)
Rule.create(name: "sat", group: "days_of_week", exclusive: FALSE)
Rule.create(name: "sun", group: "days_of_week", exclusive: FALSE)

Program.create(name: "Default Program", start_time: "6:00")

Station.all.each do |station|
	station.add_to_programs
end