module SuperActionPack
	class Base
		def self.to_camel_case(string)
			string.split("_").map do |word|
				letter = word.split("")
				letter[0] = letter[0].upcase
				letter.join("")
			end.join("")
		end

	end
end