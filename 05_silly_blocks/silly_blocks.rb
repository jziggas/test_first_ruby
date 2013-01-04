def reverser &block
	block.call.split.map { |word| word.reverse}.join(' ') # learned this code after six hours of banging my head against the piglatin, now I feel like a wizard
end

def adder i=1, &block
	i + yield
end

def repeater i=1, &block
	i.downto(1) do
		yield
	end
end