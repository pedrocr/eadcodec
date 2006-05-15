require "XMLStreamParser"
require "rexml/document"
require "EAD"

module EAD
  # This is a stream parser that will output EAD element objects. To use it
  # all you have to do is create a listener that responds to methods called 
  # el_<eadelementname> with one argument. The argument passed will be the
  # object with the content of the EAD element.
  #
  # The actual stream parsing is done with XMLUtils::XMLStreamParser.
  class EADStreamParser
  	def initialize(listener=nil)
  		@listener = listener
  	end

    # Parse the text of the EAD file. This can be any IO capable object, like a
    # string or an open file.
  	def parse(text)
  		parser = XMLUtils::XMLStreamParser.new(self)
  		parser.parse(text)
  	end
  	
  	# This is the element method that is called by XMLStreamParser everytime
  	# a XML element is finished.
  	def element(el) #:nodoc:
  		method_sym = ("el_"+el.name).to_sym
  		if @listener.respond_to?(method_sym)
  			cl = XMLCodec::XMLElement.get_element_class(el.name.to_sym)
  			eadelement = cl.import_xml_text(el.content)
  			eadelement.element_id = el.element_id
  			eadelement.parent_id = el.parent_id
  			eadelement.__xml_text = el.content
  			
  			@listener.send(method_sym, eadelement)
  			el.consume
  		end
  	end
  end
end
