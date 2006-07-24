module EADCodec
  class PhysLoc < EADElement
    include WithText
    elname "physloc"
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :encodinganalog
    xmlattr :id
    xmlattr :label
    xmlattr :parent
    xmlattr :type
    
    xmlsubelements
  end
end
