require "EAD.rb"

module EAD
  class EADSubordinates < EADElement
    elname "dsc"
  
    include EADLevels
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :encondinganalog
    xmlattr :id
    xmlattr :othertype
    xmlattr :tpattern
    xmlattr :type
    
    xmlsubel :head
    xmlsubel_mult :p
    xmlsubel_mult :c

    def description_level
      0
    end

    def unnumbered?
      false
    end
  end
end
