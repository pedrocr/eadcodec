class PhysFacet < EADElement
  include WithText
  elname "physfacet"
  
  xmlattr :altrender
  xmlattr :audience
  xmlattr :encodinganalog
  xmlattr :id
  xmlattr :label
  xmlattr :rules
  xmlattr :source
  xmlattr :type
  xmlattr :unit
  
  xmlsubelements
end
