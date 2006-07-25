class UnitId < EADElement
  include WithText
  elname "unitid"
  
  xmlattr :altrender
  xmlattr :audience
  xmlattr :countrycode
  xmlattr :encodinganalog
  xmlattr :id
  xmlattr :identifier
  xmlattr :label
  xmlattr :repositorycode
  xmlattr :type
  
  xmlsubelements
end
