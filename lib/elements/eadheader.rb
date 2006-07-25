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
