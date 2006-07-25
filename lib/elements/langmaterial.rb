module EADCodec
  class LangMaterial < EADElement
    include WithText
    elname "langmaterial"
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :encodinganalog
    xmlattr :id
    xmlattr :label
    
    xmlsubelements
  end
end
