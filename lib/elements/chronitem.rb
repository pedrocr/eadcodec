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
