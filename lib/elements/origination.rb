class Origination < EADElement
  include WithText
  elname "origination"
  
  xmlattr :altrender
  xmlattr :audience
  xmlattr :encodinganalog
  xmlattr :id
  xmlattr :label
  
  xmlsubelements
end
