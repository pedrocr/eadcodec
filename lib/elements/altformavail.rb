module EADCodec
  class AltFormAvail < EADElement
    include WithParagraphs
    elname "altformavail"
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :encodinganalog
    xmlattr :id
    xmlattr :type
    
    xmlsubelements
  end
end
