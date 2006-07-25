module EADCodec
  class Odd < EADElement
    include WithParagraphs
  
    elname 'odd'
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :encodinganalog
    xmlattr :id
    xmlattr :type
    
    xmlsubelements
  end
end
