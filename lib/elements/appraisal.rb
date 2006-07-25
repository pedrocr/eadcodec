class Appraisal < EADElement
  include WithParagraphs
  elname "appraisal"
  
  xmlattr :altrender
  xmlattr :audience
  xmlattr :encodinganalog
  xmlattr :id
  
  xmlsubelements
end
