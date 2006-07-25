module EADCodec
  class OriginalsLoc < EADElement
    include WithParagraphs
    elname "originalsloc"
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :encodinganalog
    xmlattr :id
    xmlattr :type
    
    xmlsubelements
  end
end
