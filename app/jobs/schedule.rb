class Schedule
  include SuckerPunch::Job

  def perform
  	(1..60).each do |i|
  		sleep 1
  		puts i
  	end
  end

end