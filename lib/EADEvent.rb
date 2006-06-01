module EAD
  class EADEvent < EADElement
    elname "event"
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :id
    
    xmlsubelements
  end
end
