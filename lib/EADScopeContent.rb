module EAD
  class EADScopeContent < EADElement
    elname "scopecontent"
  
    xmlattr :altrender
    xmlattr :audience
    xmlattr :encodinganalog
    xmlattr :id
  
    xmlsubel :head
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
