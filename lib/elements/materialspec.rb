module EADCodec
  class MaterialSpec < EADElement
    include WithText
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
