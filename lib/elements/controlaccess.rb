module EADCodec
  class ControlAccess < EADElement
    elname :controlaccess
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :encodinganalog
    xmlattr :id
    
    xmlsubelements
  end
end
