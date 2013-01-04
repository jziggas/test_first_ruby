# This took me forever to figure out (~3 hours), but once I did it was so simple!

class RPNCalculator
	attr_accessor :stack,:value

	def initialize
		@stack = []
	end

	def push n
		@stack << n
	end

	def plus
		if @stack.length == 0
			raise "calculator is empty"
		else
			@stack << stack.pop + @stack.pop
		end
	end

	def minus
		if @stack.length == 0
			raise "calculator is empty"
		else
			@stack << @stack.pop - @stack.pop
		end
	end

	def divide
		if @stack.length == 0
			raise "calculator is empty"
		else
			@stack << @stack.pop.to_f / @stack.pop
		end
	end

	def times
		if @stack.length == 0
			raise "calculator is empty"
		else
			@stack << @stack.pop * @stack.pop
		end
	end

	def value
		@stack.last
	end

	def tokens tokenize_me
		tokenize_me.split.each.map do |t|
			if t == '+' || t == '-' || t == '*' || t == '/'
				t.to_sym
			else
				t.to_i
			end
		end
	end

	def evaluate string_of_tokens
		@stack = []
		tokens(string_of_tokens).each do |token|
			push token if token.is_a?(Numeric)
			plus if token == :+
			minus if token == :-
			times if token == :*
			divide if token == :/
		end
		value
	end

end