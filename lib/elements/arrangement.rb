class Arrangement < EADElement
  include WithParagraphs
  elname "arrangement"
  
  xmlattr :altrender
  xmlattr :audience
  xmlattr :encodinganalog
  xmlattr :id

  xmlsubelements
end
