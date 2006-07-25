module EADCodec
  class Subordinates < EADElement
    elname "dsc"
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :encondinganalog
    xmlattr :id
    xmlattr :othertype
    xmlattr :tpattern
    xmlattr :type
    
    xmlsubelements

    def description_level
      0
    end

    def unnumbered?
      false
    end
  end
end
