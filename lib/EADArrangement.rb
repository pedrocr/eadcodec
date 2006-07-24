module EADCodec
  class Arrangement < EADElement
    elname "arrangement"
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :encodinganalog
    xmlattr :id

    xmlsubelements
  end
end
