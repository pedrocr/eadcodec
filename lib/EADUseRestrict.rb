module EADCodec
  class UseRestrict < EADElement
    include WithParagraphs
    elname "userestrict"
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :encodinganalog
    xmlattr :id
    xmlattr :type
    
    xmlsubelements
  end
end
