class Id < EADElement
	elname 'eadid'
	elwithvalue

	xmlattr :countrycode
	xmlattr :encodinganalog
	xmlattr :identifier
	xmlattr :mainagencycode
	xmlattr :publicid
	xmlattr :url
	xmlattr :urn
end
