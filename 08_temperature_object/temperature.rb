class Temperature
	attr_accessor :f, :c

	def initialize options={}
		@f = options[:f]
		@c = options[:c]

		if f
			@c = Temperature.ftoc(@f)
		else
			@f = Temperature.ctof(@c)
		end
	end

	def in_celsius
		@c
	end

	def in_fahrenheit
		@f
	end

	def self.from_fahrenheit f
		self.new :f => f
	end

	def self.from_celsius c
		self.new :c => c
	end

	def self.ftoc f
		((f.to_f - 32) * 5.0/9.0)
	end

	def self.ctof c
		((c.to_f * 9.0/5.0) + 32)
	end

end

class Celsius < Temperature

	def initialize(t)
		super({c: t})
	end

end

class Fahrenheit < Temperature

	def initialize(t)
		super({f: t})
	end
end