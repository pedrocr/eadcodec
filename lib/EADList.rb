module EAD
  class EADList < EADElement
    elname "list"
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :continuation
    xmlattr :id
    xmlattr :mark
    xmlattr :numeration
    xmlattr :type
    
    xmlsubelements
  end
  
  class EADDefItem < EADElement 
    elname "defitem"
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :id
    
    xmlsubel :label
    xmlsubel :item
  end
  
  class EADItem < EADElement 
    elname "item"
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :id
    
    xmlsubelements
  end
end
