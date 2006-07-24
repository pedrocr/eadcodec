module EADCodec
  class Container < EADElement
    elname "container"
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :encodinganalog
    xmlattr :id
    xmlattr :label
    xmlattr :parent
    xmlattr :type
    
    xmlsubelements
  end
end
