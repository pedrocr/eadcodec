class AcqInfo < EADElement
  include WithParagraphs
  elname "acqinfo"
  
  xmlattr :altrender
  xmlattr :audience
  xmlattr :encodinganalog
  xmlattr :id
  xmlattr :label
  
  xmlsubelements
end
