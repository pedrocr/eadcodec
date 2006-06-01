module EAD
  class EADAppraisal < EADElement
    elname "appraisal"
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :encodinganalog
    xmlattr :id
    
    xmlsubelements
  end
end
