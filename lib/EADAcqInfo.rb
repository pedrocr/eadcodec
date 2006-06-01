module EAD
  class EADAcqInfo < EADElement
    elname "acqinfo"
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :encodinganalog
    xmlattr :id
    xmlattr :label
    
    xmlsubelements
  end
end
