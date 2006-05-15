require "TestEAD"

class TestEADDescription < TestEAD
	def initialize(*args)
		super(*args)

		@test_file = "test_ead_description.xml"

		@head = "HEADTest"
		@origination = "somwhere"
		@unittitle = "Some Title"
		@unitid = "15235"
		@abstract = "Some Abstract"
		@physdesc = "Some Description"
		@physloc = "Some Location"

		@unitdate = "1/1/2001"
		@unitdatelabel = "TestLabel"
		@unitdatetype = "inclusive"
	end

	def test_description
		did = EAD::EADDescription.new
		did.head = @head
		did.origination = @origination
		did.unittitle = @unittitle
		did.unitid = @unitid
		did.abstract = @abstract
		did.physdesc = @physdesc
		did.physloc = @physloc

		did.unitdate = EAD::EADUnitDate.new(@unitdate)
		did.unitdate.label = @unitdatelabel
		did.unitdate.type = @unitdatetype

		@ead.add_description(did)
		export

		# Since we've added content it is now valid EAD
		validate_dtd

		element_exists("/ead/archdesc/did", "Test did exists")
		compare_xpath(@head, "/ead/archdesc/did/head")
		compare_xpath(@origination, "/ead/archdesc/did/origination")
		compare_xpath(@unittitle, "/ead/archdesc/did/unittitle")	
		compare_xpath(@abstract, "/ead/archdesc/did/abstract")
		compare_xpath(@physdesc, "/ead/archdesc/did/physdesc")
		compare_xpath(@physloc, "/ead/archdesc/did/physloc")
		compare_xpath(@unitid, "/ead/archdesc/did/unitid")

		compare_xpath(@unitdate, "/ead/archdesc/did/unitdate")
		compare_xpath(@unitdatelabel, "/ead/archdesc/did/unitdate/@label")
		compare_xpath(@unitdatetype, "/ead/archdesc/did/unitdate/@type")
	end


	def test_import_description
		import
		did = @ead.ead_did

		assert_equal(@head, did.head.value)
		assert_equal(@origination, did.origination.value) 
		assert_equal(@unittitle, did.unittitle.value) 
		assert_equal(@unitid, did.unitid.value)
		assert_equal(@abstract, did.abstract.value)
		assert_equal(@physdesc, did.physdesc.value)
		assert_equal(@physloc, did.physloc.value)

		assert_equal(@unitdate, did.unitdate.value)
		assert_equal(@unitdatelabel, did.unitdate.label) 
		assert_equal(@unitdatetype, did.unitdate.type)
	end
end
