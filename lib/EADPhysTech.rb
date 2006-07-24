module EADCodec
	class PhysTech < EADElement
		elname "phystech"
	
		xmlsubel :head
		xmlsubel_mult :p
		
		def value
			str = ""
			p.each do |par|
				str += "<p>"+par.value+"</p>\n"
			end
			str
		end
	end
end
