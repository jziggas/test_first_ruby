class Timer
	attr_accessor :seconds

	def initialize
		@seconds = 0
	end

	def time_string
		if @seconds == 0
			"00:00:00"
		else
			# I have no idea what I did here. I spent entirely way too long just playing with numbers until it started working.
			# I shouldn't code and watch Gossip Girl with my girlfriend at the same time... mental note to work on my math skills
			# Apparently this works for a 24 hour period, with 86400 seconds in a day resulting in => 124:00:00
			"#{seconds/3600/24}#{seconds/3600}:#{seconds/60%60/10}#{seconds/60%60}:#{seconds%60/10}#{seconds%60%10}"
		end	
	end
end

# Skipping helper method 'padded' because it won't work with my code