class Head < EADElement
  include WithText
  elname "head"
  
  xmlattr :althead
  xmlattr :altrender
  xmlattr :audience
  xmlattr :id
    
  xmlsubelements
end
