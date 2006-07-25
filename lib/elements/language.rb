class Language < EADElement
	elname "language"

	xmlattr :altrender
	xmlattr :audience
	xmlattr :encodinganalog
	xmlattr :id
	xmlattr :langcode
	xmlattr :scriptcode
	
	xmlsubelements
	
	def initialize(*values)
	  if values
		  values.each do |v|
  		  self.subelements << v
  		end
    end
	end
end
