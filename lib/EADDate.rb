module EAD
	class EADDate < EADElement
		elname "date"
		elwithvalue

		xmlattr :altrender
		xmlattr :audience
		xmlattr :calendar
		xmlattr :certainty
		xmlattr :encodinganalog
		xmlattr :era
		xmlattr :id
		xmlattr :normal
		xmlattr :type
	end

	class EADUnitDate < EADDate	
		elname "unitdate"
		elwithvalue
		
		xmlattr :datechar
		xmlattr :label
	end
end
