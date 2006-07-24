module EADCodec
  class AltFormAvail < EADElement
    elname "altformavail"
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :encodinganalog
    xmlattr :id
    xmlattr :type
    
    xmlsubelements
  end
end
