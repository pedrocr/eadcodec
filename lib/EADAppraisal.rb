module EADCodec
  class Appraisal < EADElement
    elname "appraisal"
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :encodinganalog
    xmlattr :id
    
    xmlsubelements
  end
end
