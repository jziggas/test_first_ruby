def add(x,y)
	x + y
end

def subtract(x,y)
	x - y
end

def sum(numbers)
	sum = 0
	numbers.each do |number|
		sum += number
	end
	sum
end

def multiply(numbers)
	product = 1
	numbers.each do |number|
		product *= number
	end
	product
end

def power(base, exponent)
	base**exponent
end

def factorial(number)
	number > 1 ? number * factorial(number - 1) : 1
end
