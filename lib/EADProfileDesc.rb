module EADCodec
	class Creation < EADElement
		elname "creation"
		xmlsubelements
	end

	class ProfileDesc < EADElement
		elname "profiledesc"
		
		xmlattr :altrender
		xmlattr :audience
		xmlattr :encodinganalog
		xmlattr :id
		
		xmlsubel :creation
	end
end
