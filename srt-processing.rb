#create an srt file
#when prompted shifts subtile forward or backwards a random amount of miliseconds
#prints out new srt file with correct times

require "pp"
require "date"
require "time"


class TimeShift

	def time(direction, rip_file)
		@direction = direction
		now = "2015-01-01 00:00:10,500"
		time_stamp = Time.parse(now)
		puts time_stamp

		if direction == "forwards"
			time_new = time_stamp + (rand(2000.0..3300.0)/1000)
			return time_new.strftime('%H:%M:%S,%3N')
		elsif direction == "backwards"
			time_new = time_stamp - (rand(2000.0..3300.0)/1000)
			return time_new.strftime('%H:%M:%S,%3N')
		else
			puts "Please enter either Forwards or Backwards."
		end
	end
end


class File
	attr_reader :time1, :time2
	def initialize(name)
		@name = name
	end
	def readfile
		subtiles = IO.readlines("subrip.txt")#.split("\n")
		sub_times = subtiles[1].split(" --> ")
		@time1 = sub_times[0] #first time
		@time2 = sub_times[1] #second time
	end
end

#_______________________________________________________________

puts "Move the subrip forwards or backwards?"
direction = gets.chomp
subrip = File.new "shesh"
time_stamps = subrip.readfile
french = TimeShift.new
puts french.time(direction, time_stamps)






# cur_time = Time.new(2015,01,01, h,m,sec,milsec)
cur_time = Time.parse("2015-01-01 00:00:10,500")
# puts cur_time.strftime('%H:%M:%S,%3N')






