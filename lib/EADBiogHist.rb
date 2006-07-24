require "eadcodec"

module EADCodec
	class BiogHist < EADElement
		elname "bioghist"
	
		xmlsubel :head
		xmlsubel_mult :p
	end
end
