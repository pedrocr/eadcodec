module EADCodec
  class Note < EADElement
    elname "note"
  
    xmlattr :actuate
    xmlattr :altrender
    xmlattr :audience
    xmlattr :encodinganalog
    xmlattr :id
    xmlattr :label
    xmlattr :show
    xmlattr :type
  
    xmlsubel_mult :p
    
    def value
      str = ""
      p.each do |par|
        str += "<p>"+par.value+"</p>\n"
      end
      str
    end
  end
end
