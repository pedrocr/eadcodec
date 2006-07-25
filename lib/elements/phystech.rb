module EADCodec
  class PhysTech < EADElement
    include WithParagraphs
  
    elname "phystech"
  
    def initialize(value=nil)
      self << P.new(value) if value
    end
  
    xmlsubelements
  end
end
