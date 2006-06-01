module EAD
  class EADMaterialSpec < EADElement
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
