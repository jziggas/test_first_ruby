class Array
	
	def sum
		total = 0
		self.each { |element|	total += element }
		total
	end

	def square
		self.map { |element| element * element }
	end

	def square!
		self.each_index { |i| self[i] *= self[i] }
	end


end
