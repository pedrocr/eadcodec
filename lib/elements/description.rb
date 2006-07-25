module EADCodec
	class Description < EADElement	
		elname "did"
	
		xmlattr :altrender
		xmlattr :audience
		xmlattr :encodinganalog
		xmlattr :id
	
		xmlsubelements
	end
end
