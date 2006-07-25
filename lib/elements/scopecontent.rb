class ScopeContent < EADElement
  include WithParagraphs

  elname "scopecontent"

  xmlattr :altrender
  xmlattr :audience
  xmlattr :encodinganalog
  xmlattr :id

  xmlsubelements
end
