module EADCodec
	class Id < EADElement
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

	class TitleStatement < EADElement
		elname 'titlestmt'
	
		xmlsubel :author
		xmlsubel :sponsor
		xmlsubel :subtitle
		xmlsubel :titleproper

		def initialize(title)
			self.titleproper = title
		end
	end

	class FileDesc < EADElement
		elname 'filedesc'
	
		xmlattr :altrender
		xmlattr :audience
		xmlattr :encodinganalog
		xmlattr :id
		xmlsubel :titlestmt

		def initialize(title)
			self.titlestmt = TitleStatement.new(title)
		end
	end

	class Header < EADElement
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
			self.eadid = Id.new(id)
			self.filedesc = FileDesc.new(title)
		end

		def eadtitle
			self.filedesc.titlestmt.titleproper
		end
	end
end
