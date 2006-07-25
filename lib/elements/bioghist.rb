module EADCodec
  class BiogHist < EADElement
    include WithParagraphs
    elname "bioghist"
  
    xmlattr :altrender
    xmlattr :audience
    xmlattr :encodinganalog
    xmlattr :id
  
    xmlsubelements
  end
end
