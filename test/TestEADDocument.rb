require "TestEAD"

class TestEADDocument < TestEAD
	def setup
		super
		@test_file = "test_ead_document.xml"
	end

	def test_base_export
		export
		# The base document has an empty archdesc and is thus not valid EAD
		# Just check for well-formed XML, although REXML will probably never
		# output anything else.
		validate_well_formed 

		compare_xpath("1", "/ead/eadheader/eadid")
		compare_xpath("Teste", "/ead/eadheader/filedesc/titlestmt/titleproper")
	end

	def test_base_import
		import
		assert_equal("1", @ead.eadheader.eadid.value)
		assert_equal("Teste", @ead.eadheader.eadtitle.value)
	end

	#def test_import_export_2
	#	@test_file = "examples/example2.xml"
	#	import
	#	@test_file = "examples/example2_exported.xml"
	#	export
	#end
end
