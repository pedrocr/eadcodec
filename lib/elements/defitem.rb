class DefItem < EADElement 
  elname "defitem"
  
  xmlattr :altrender
  xmlattr :audience
  xmlattr :id
  
  xmlsubel :label
  xmlsubel :item
end
