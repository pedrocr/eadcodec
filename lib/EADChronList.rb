module EADCodec
  class ChronList < EADElement
    elname "chronlist"
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :encodinganalog
    xmlattr :id
    
    xmlsubelements
  end
  
  class ChronItem < EADElement
    elname "chronitem"
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :encodinganalog
    xmlattr :id
    
    xmlsubel :date
    xmlsubel :event
    xmlsubel :eventgrp
  end
end


