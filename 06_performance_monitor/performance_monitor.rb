def measure i = 1, &block
	start_time = Time.now
	total_time = 0
	i.downto(1) do
		yield
		end_time = Time.now
		total_time = (start_time - end_time).abs
	end
	total_time / i
end