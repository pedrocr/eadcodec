require "EAD"

module EAD
	class EADBiogHist < EADElement
		elname "bioghist"
	
		xmlsubel :head
		xmlsubel_mult :p
	end
end
