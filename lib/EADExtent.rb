module EAD
  class EADExtent < EADElement
    elname "extent"
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :encodinganalog
    xmlattr :id
    xmlattr :label
    xmlattr :type
    xmlattr :unit
    
    xmlsubelements
  end
end
