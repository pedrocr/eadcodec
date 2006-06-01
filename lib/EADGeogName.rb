module EAD
  class EADGeogName < EADElement
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
  end
end
