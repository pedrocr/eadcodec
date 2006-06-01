module EAD
  class EADControlAccess < EADElement
    elname :controlaccess
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :encodinganalog
    xmlattr :id
    
    xmlsubelements
  end
end
