module EADCodec
  class Label < EADElement
    elname "label"
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :id
    
    xmlsubelements
  end
end
