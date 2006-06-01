module EAD
  class EADChronList < EADElement
    elname "chronlist"
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :encodinganalog
    xmlattr :id
    
    xmlsubelements
  end
  
  class EADChronItem < EADElement
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


