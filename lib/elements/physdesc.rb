class PhysDesc < EADElement
  include WithText
  elname "physdesc"
  
  xmlattr :altrender
  xmlattr :audience
  xmlattr :encodinganalog
  xmlattr :id
  xmlattr :label
  xmlattr :rules
  xmlattr :source
  
  xmlsubelements
end
