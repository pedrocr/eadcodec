module EAD
	class EADLanguage < EADElement
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

	class EADLangMaterial < EADElement
		elname "langmaterial"

		xmlattr :altrender
		xmlattr :audience
		xmlattr :encodinganalog
		xmlattr :id
		xmlattr :label
		
		xmlsubelements
		
		def initialize(*values)
		  if values
  		  values.each do |v|
    		  self.subelements << v
    		end
      end
		end
	end
end
