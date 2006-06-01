module EAD
  class EADCustodHist < EADElement
    elname "custodhist"
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :encodinganalog
    xmlattr :id
    
    xmlsubelements
  end
end
