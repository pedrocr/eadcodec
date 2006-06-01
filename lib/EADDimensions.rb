module EAD
  class EADDimensions < EADElement
    elname "dimensions"
    
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
