class Accruals < EADElement
  include WithParagraphs
  elname "accruals"
  
  xmlattr :altrender
  xmlattr :audience
  xmlattr :encodinganalog
  xmlattr :id
  
  xmlsubelements
end
