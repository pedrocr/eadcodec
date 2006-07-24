module EADCodec
  class RelatedMaterial < EADElement
    include WithParagraphs
    elname "relatedmaterial"
  
    xmlattr :altrender
    xmlattr :audience
    xmlattr :encodinganalog
    xmlattr :id
    xmlattr :type

    xmlsubelements
  end
end
