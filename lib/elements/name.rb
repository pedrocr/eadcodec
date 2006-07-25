module EADCodec
  class Name < EADElement
    elname "name"
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :authfilenumber
    xmlattr :encodinganalog
    xmlattr :id
    xmlattr :normal
    xmlattr :role
    xmlattr :rules
    xmlattr :source
    
    xmlsubelements
  end
end
