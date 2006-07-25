class Note < EADElement
  include WithParagraphs
  elname "note"

  xmlattr :actuate
  xmlattr :altrender
  xmlattr :audience
  xmlattr :encodinganalog
  xmlattr :id
  xmlattr :label
  xmlattr :show
  xmlattr :type

  xmlsubelements
end
