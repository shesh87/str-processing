#create an srt file
#when prompted shifts subtile forward or backwards a random amount of miliseconds
#prints out new srt file with correct times

require "pp"
require "date"
require "time"


class TimeShift
	def time(direction, start_time, end_time)
		@direction = direction
		@start_time = start_time
		@end_time = end_time
		time_stamp_start = Time.parse(start_time)
		time_stamp_end = Time.parse(end_time)

		difference = time_stamp_end - time_stamp_start #2500 milsec
		random_milsec = (rand(2000.0..3300.0)/1000)
		puts random_milsec
		if direction == "forwards"
			new_start = time_stamp_start + random_milsec
			new_end = time_stamp_end + random_milsec
			# puts "#{new_start.strftime('%H:%M:%S,%3N')}--> #{new_end.strftime('%H:%M:%S,%3N')}"

		elsif direction == "backwards"
			new_start = time_stamp_start - random_milsec
			new_end = time_stamp_end - random_milsec
			# puts "#{new_start.strftime('%H:%M:%S,%3N')} --> #{new_end.strftime('%H:%M:%S,%3N')}"
		else
			puts "Please enter either Forwards or Backwards."
		end
	end
end


# class File
# 	attr_reader :time1, :time2
# 	def initialize(name)
# 		@name = name
# 	end
# 	def readfile
# 		subtiles = IO.readlines("subrip.txt")#.split("\n")
# 		sub_times = subtiles[1].split(" --> ")
# 		@time1 = sub_times[0] #first time
# 		@time2 = sub_times[1] #second time
# 	end
# 	def timestamps
# 		time2 = @time2
# 	end
# end

#_______________________________________________________________

# puts "Move the subrip forwards or backwards?"
# direction = (gets.chomp).downcase
# subrip = File.new "shesh"
# time_stamps = subrip.readfile
# french = TimeShift.new
# puts french.time(direction, time_stamps)


shifting_time = TimeShift.new
puts "Move the subrip forwards or backwards?"
direction = (gets.chomp).downcase

subtiles = IO.readlines("subrip.txt")
sub_times = subtiles[1].split(" --> ")
time1 = sub_times[0] #first time
time2 = sub_times[1] #second time

shifting_time.time(direction, sub_times[0], sub_times[1])









# cur_time = Time.new(2015,01,01, h,m,sec,milsec)
cur_time = Time.parse("2015-01-01 00:00:10,500")
# puts cur_time.strftime('%H:%M:%S,%3N')






