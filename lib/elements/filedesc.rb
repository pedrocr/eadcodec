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
