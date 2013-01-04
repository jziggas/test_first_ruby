=begin
Got way too overwhelmed with this. I was playing with regular expressions, and after adding code to make each 
test work it became more and more convoluted.  I got stuck with making punctuation work, and without another
set of eyes to guide me in the right direction, I'm deciding to rewrite the code based on another solution I found on gist: https://gist.github.com/3786206 which is much cleaner and makes more sense to me -- and comment on each line to make sure I understand what is going on.
def translate(w)
	words = w.split #split string into array of multiple words
	punctuation = w.split(/\W/)
	translation = [] #new array to insert each newly translated word
	words.each do |word|

		needsCapitalization = false

		if word == word.capitalize
			needsCapitalization = true

		if word[0] =~ /[aeiou]/
			word = word + 'ay' #if the string starts with a vowel, add 'ay' to the end
		elsif (word.index" qu") # needs to be < 2 so that words such as "antiquated" do not pass, however this results in an error
			word = word[word.index('qu') + 2 .. word.length - 1] + word[0 .. word.index('qu')] + 'uay' # Feels like dirty hack after playing with regex. Searches for 'qu' phoneme
		else
			word = word[word.index(/[aeiou]/) .. word.length - 1] + word[0 .. word.index(/[aeiou]/) - 1] + 'ay' # Playing with regex turned into mistake after hitting the 'qu' tests :( Translates words beginning with a consonant by slicing before the first vowel and appending to the end
		end

		if needsCapitalization
			word.capitalize!
		end

		translation << word
	end
	puts punctuation
	translation.join ' ' # join the new array of words together with spaces
end

puts translate "the, Quick Brown fox."
=end

module PigLatin
	def to_pig_latin(s)
		starts_with_vowel = /\A[aeiouy]/

		until s =~ starts_with_vowel	# Until the start of the string (\A) begins with a vowel ([aeiouy]) ; =~ is the matching comparison operator
			if s[0,2] == "qu"	# If the first two chars of the string = "qu"
				s += s.slice!(0,2)	# Then slice off the first two chars first, and append them to the end of the string; to me, this is a clever use of ! I had not thought of, as the slice occurs before the assignment operator
			else
				s += s.slice!(0)	# Otherwise, slice off the first character and append to the end of the string 
			end
		end

		s + "ay"	# return the string with "ay"
	end

	def translate(s)
		ends_with_symbol = /[\.:,;!\?]\Z/	
			# [] brackets match any single character within them 
			# the question mark is a regex symbol so it must be escaped with a \
			# \Z matches the end of the string unless the string ends with a ``\n'', in which case it matches just before the ``\n''.
			# Therefore, the whole expression means: Any single . : , ; ! or ? at the end of a string

			if s.split.size > 1
				# if the string has several words, translate each one by splitting them into an array, 
				# returning the array with the results of running block once for every element in the array,
				# and joining the results with a space. 
				s = s.split.map { |e| translate(e) }.join(' ')
			else
				# Check to see if first letter is capitalized, set boolean to true if it is, so we know to recapitalize later
				recapitalize = true if s[0] == s[0].upcase
				# Check if string has punctuation. If so, remove it and save for later
				# negative index starts at the end of an array and progresses to the beginning, therefore s.slice!(-1) immediately slices last char,
				# and assigned to punctuation if it ends with a symbol. punctuation = '' otherwise because first part of OR operator is executed first.
				punctuation = (s.slice!(-1) if s =~ ends_with_symbol) || '' 

				# Once recursion reaches a sifngle word, we begin translating each single word to pig latin
				 s = to_pig_latin(s)

				# The ! operator immediately performs the function rather than returning an object
				# Therefore, the string is downcased and capitalized if it needs to be capitalize. "oobarFay" -> "oobarfay" -> "Oobarfay"
				s.downcase!.capitalize! if recapitalize

				s + punctuation
			end
	end
end

include PigLatin

puts "Enter any phrase or sentence, make sure to include the word 'square' somewhere:"
x = gets
puts translate x