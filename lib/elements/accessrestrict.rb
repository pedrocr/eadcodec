class AccessRestrict < EADElement
  include WithParagraphs
  elname "accessrestrict"
  
  xmlattr :altrender
  xmlattr :audience
  xmlattr :encodinganalog
  xmlattr :id
  xmlattr :type
  
  xmlsubelements
end
