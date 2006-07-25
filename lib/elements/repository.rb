module EADCodec
  class Repository < EADElement
    include WithText
    elname "repository"
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :encodinganalog
    xmlattr :id
    xmlattr :label
    
    xmlsubelements
  end
end
