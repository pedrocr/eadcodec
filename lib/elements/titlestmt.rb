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
