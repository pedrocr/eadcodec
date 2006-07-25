class OtherFindAid < EADElement
  include WithParagraphs
  elname "otherfindaid"
  
  xmlattr :altrender
  xmlattr :audience
  xmlattr :encodinganalog
  xmlattr :id
  
  xmlsubelements
end
