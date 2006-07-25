module EADCodec
	class Date < EADElement
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

	class UnitDate < Date	
		elname "unitdate"
		elwithvalue
		
		xmlattr :datechar
		xmlattr :label
	end
end
