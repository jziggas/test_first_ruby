def echo(echo_what) 
	echo_what
end

def shout(shout_what)
	shout_what.upcase
end

def repeat(word, i=2)
	("#{word} "*i).strip
end

def start_of_word(word,numberOfElements)
	word[0..numberOfElements-1]
end

def first_word(word)
	word.split[0]
end

def titleize(word)
	words = word.split
	for i in (0..words.length-1) do
		if i == 0
			words[i].capitalize!
		elsif i == words.length - 1
			words[i] = words[i].capitalize
		else
			if words[i].length > 4
				words[i].capitalize!
			end
		end
	end
	words.join ' '

end