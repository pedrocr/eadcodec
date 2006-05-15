module EAD
	class EADId < EADElement
		elname 'eadid'
		elwithvalue
	
		xmlattr :countrycode
		xmlattr :encodinganalog
		xmlattr :identifier
		xmlattr :mainagencycode
		xmlattr :publicid
		xmlattr :url
		xmlattr :urn
	end

	class EADTitleStatement < EADElement
		elname 'titlestmt'
	
		xmlsubel :author
		xmlsubel :sponsor
		xmlsubel :subtitle
		xmlsubel :titleproper

		def initialize(title)
			self.titleproper = title
		end
	end

	class EADFileDesc < EADElement
		elname 'filedesc'
	
		xmlattr :altrender
		xmlattr :audience
		xmlattr :encodinganalog
		xmlattr :id
		xmlsubel :titlestmt

		def initialize(title)
			self.titlestmt = EADTitleStatement.new(title)
		end
	end

	class EADHeader < EADElement
		elname 'eadheader'

		xmlattr :altrender
		xmlattr :audience
		xmlattr :countryenconding
		xmlattr :dateencoding
		xmlattr :encodinganalog
		xmlattr :findaidstatus
		xmlattr :id
		xmlattr :langenconding
		xmlattr :relatedencoding
		xmlattr :repositoryencoding
		xmlattr :scriptencoding

		xmlsubel :eadid
		xmlsubel :filedesc
		xmlsubel :profiledesc
		
		def initialize(id, title)
			self.eadid = EADId.new(id)
			self.filedesc = EADFileDesc.new(title)
		end

		def eadtitle
			self.filedesc.titlestmt.titleproper
		end
	end
end
