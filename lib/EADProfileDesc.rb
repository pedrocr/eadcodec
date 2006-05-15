module EAD
	class EADCreation < EADElement
		elname "creation"
		xmlsubelements
	end

	class EADProfileDesc < EADElement
		elname "profiledesc"
		
		xmlattr :altrender
		xmlattr :audience
		xmlattr :encodinganalog
		xmlattr :id
		
		xmlsubel :creation
	end
end
