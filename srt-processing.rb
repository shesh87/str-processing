#create an srt file
#when prompted shifts subtile forward or backwards a random amount of miliseconds

class SRT

	def time(direction)
		@direction = direction.downcase
		if direction == "forwards"
			new_time = current_time + rand(2000..3000)
		elsif direction == "backwards"
			new_time = current_time - rand(2000..3000)
		else
			puts "Please enter either Forwards or Backwards."
		end
	end
	def timeshift
		puts "
		001
		00:00:10,500 --> 00:00:13,000
		Elephant's Dream
		
		002
		00:00:15,000 --> 00:00:18,000
		At the left we can see...
		"
	end
end


srt_file = SRT.new
# srt_file.time "forward"
# puts rand(2000..3000)