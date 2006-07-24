require "EADDate"

module EADCodec
	class Description < EADElement	
		elname "did"
	
		xmlattr :altrender
		xmlattr :audience
		xmlattr :encodinganalog
		xmlattr :id
	
		xmlsubel :head
		xmlsubel :origination
		xmlsubel :unittitle
		xmlsubel :unitid
		xmlsubel :abstract
		xmlsubel :physdesc
		xmlsubel :physloc
		xmlsubel :unitdate
		xmlsubel :langmaterial
	end
end
