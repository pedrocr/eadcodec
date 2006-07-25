class Bibliography < EADElement
  include WithParagraphs
  elname "bibliography"
  
  xmlattr :altrender
  xmlattr :audience
  xmlattr :encodinganalog
  xmlattr :id
  xmlattr :type
  
  xmlsubelements
end
