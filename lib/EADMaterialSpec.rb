module EADCodec
  class MaterialSpec < EADElement
    elname "materialspec"
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :encodinganalog
    xmlattr :id
    xmlattr :label
    xmlattr :type
    
    xmlsubelements
  end
end
