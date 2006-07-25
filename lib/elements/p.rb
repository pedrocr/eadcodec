class P < EADElement
  include WithText
  elname "p"
  
  xmlattr :altrender
  xmlattr :audience
  xmlattr :id
    
  xmlsubelements
end
