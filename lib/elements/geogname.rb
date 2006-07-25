class GeogName < EADElement
  include WithText
  elname 'geogname'
  
  xmlattr :altrender
  xmlattr :audience
  xmlattr :authfilenumber
  xmlattr :encondinganalog
  xmlattr :id
  xmlattr :normal
  xmlattr :role
  xmlattr :rules
  xmlattr :source
  
  xmlsubelements
end
