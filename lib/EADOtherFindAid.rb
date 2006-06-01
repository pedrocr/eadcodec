module EAD
  class EADOtherFindAid < EADElement
    elname "otherfindaid"
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :encodinganalog
    xmlattr :id
    
    xmlsubelements
  end
end
