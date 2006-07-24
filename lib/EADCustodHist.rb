module EADCodec
  class CustodHist < EADElement
    elname "custodhist"
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :encodinganalog
    xmlattr :id
    
    xmlsubelements
  end
end
