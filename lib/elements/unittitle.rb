class UnitTitle < EADElement
  include WithText
  elname "unittitle"
  
  xmlattr :altrender
  xmlattr :audience
  xmlattr :encodinganalog
  xmlattr :id
  xmlattr :label
  xmlattr :type
  
  xmlsubelements
end
