class Dictionary

  attr_accessor :entries, :keywords

  def initialize
    @entries = {}
  end


  def add entry
  	if entry.class == String
	  	@entries[entry] = nil
	  else 
			entry.each do |key, value|
				@entries[key] = value
			end
		end
	end

	def keywords
		@entries.keys.sort
	end

	def include? entry
		@entries.has_key? entry
	end

	 def find(entry)
    found = @entries.select { |key, value| key[0..entry.length - 1] == entry } # http://www.ruby-doc.org/core-1.9.3/Hash.html says select returns an array? This returns a Hash, though.
  end

  def printable
  	feed = ''
  	@entries.sort.each do |key, value|
  		feed += "[#{key}] \"#{value}\"\n"
  	end
  	feed.chomp
  end

end
