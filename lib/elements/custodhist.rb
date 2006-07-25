class CustodHist < EADElement
  include WithParagraphs
  elname "custodhist"
  
  xmlattr :altrender
  xmlattr :audience
  xmlattr :encodinganalog
  xmlattr :id
  
  xmlsubelements
end
