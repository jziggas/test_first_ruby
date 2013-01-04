class Book
	attr_accessor :title, :badwords

	def initialize
		@badwords=['the','a','an','and', 'of','in']
	end

	def title=(t)
		@title=''
		t.split.each_with_index do |word, i|
			if i == 0
				@title += word.capitalize
			elsif word == 'i'
				@title += ' I'
			elsif @badwords.include?(word)
				@title += ' ' + word
			else
				@title += ' ' + word.capitalize
			end
		end
	end

end

