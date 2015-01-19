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

		difference = time_stamp_end - time_stamp_start
		random_milsec = (rand(2000.0..3300.0)/1000)
		puts random_milsec
		if direction == "forwards"
			new_start = time_stamp_start + random_milsec
			new_end = time_stamp_end + random_milsec
			# puts "#{new_start.strftime('%H:%M:%S,%3N')}--> #{new_end.strftime('%H:%M:%S,%3N')}"
			return new_start.strftime('%H:%M:%S,%3N'), new_end.strftime('%H:%M:%S,%3N')

		elsif direction == "backwards"
			new_start = time_stamp_start - random_milsec
			new_end = time_stamp_end - random_milsec
			# puts "#{new_start.strftime('%H:%M:%S,%3N')}--> #{new_end.strftime('%H:%M:%S,%3N')}"
			return new_start.strftime('%H:%M:%S,%3N'), new_end.strftime('%H:%M:%S,%3N')
		else
			puts "Please enter either Forwards or Backwards."
		end
	end
end



#_______________________________________________________________



# shifting_time = TimeShift.new
# puts "Move the subrip forwards or backwards?"
# direction = (gets.chomp).downcase

# subtitles = IO.readlines("subrip.txt")
# sub_times = subtitles[1].split(" --> ")
# time1 = sub_times[0] #first time
# time2 = sub_times[1] #second time

# new_times = shifting_time.time(direction, sub_times[0], sub_times[1])


# File.write("new_subrip.txt", "#{subtitles[0]}#{new_times[0]} --> #{new_times[1]}\n#{subtitles[2]}#{subtitles[3]}\n",mode: "a")


subtitles = IO.read("subrip.txt").split("\n\n") #splits each subtile section
sub_secs = subtitles[0].split(" --> ")
subtimes = sub_secs[0].split("\n")
pp subtimes[1]





# cur_time = Time.parse("2015-01-01 00:00:10,500")
# puts cur_time.strftime('%H:%M:%S,%3N')






