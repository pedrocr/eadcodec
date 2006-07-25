require "TestEAD"

class TestEADSubtitle < TestEAD
	def setup
		super
		@test_file = "test_ead_subtitle.xml"
		@abbr = "testeabbr"
		@text = "ABCD"
	end

	def test_base_export
		titlestmt = @ead.eadheader.filedesc.titlestmt
	
		st = titlestmt.subtitle = EADCodec::Subtitle.new
		st.subelements << @text
		st.subelements << EADCodec::Abbr.new(@abbr)
		st.subelements << @text
		st.subelements << EADCodec::Abbr.new(@abbr)
		
		export
		# The base document has an empty archdesc and is thus not valid EAD
		# Just check for well-formed XML, although REXML will probably never
		# output anything else.
		validate_well_formed 

		compare_xpath("1", "/ead/eadheader/eadid")
		compare_xpath("Teste", "/ead/eadheader/filedesc/titlestmt/titleproper")
		compare_xpath(@abbr, "/ead/eadheader/filedesc/titlestmt/subtitle/abbr")
	end

	def test_base_import
		import
		st = @ead.eadheader.filedesc.titlestmt.subtitle
		assert_equal(@text, st.subelements[0].to_s)
		assert_equal(@abbr, st.subelements[1].to_s)
		assert_equal(@text, st.subelements[2].to_s)
		assert_equal(@abbr, st.subelements[3].to_s)
	end
end
