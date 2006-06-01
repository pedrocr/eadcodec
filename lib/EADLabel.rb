module EAD
  class EADLabel < EADElement
    elname "label"
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :id
    
    xmlsubelements
  end
end
