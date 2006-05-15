require "TestEAD"
require "EADStreamParser"
require "rexml/document"

class MyEADStreamListener
	attr_reader :eadheader, :did

	def el_eadheader(el)
		@eadheader = el
	end
	
	def el_did(el)
		@did = el
	end
end

class MyEADStreamListener2
	attr_reader :dsc, :c01

	def el_dsc(el)
		@dsc = el
	end
	
	def el_c01(el)
		@c01 = el
	end
end

class TestEADStreamParser < TestEAD
	def initialize(*args)
		super(*args)

		@test_file = "test_ead_stream_parser.xml"

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

	def test_base_import
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
		
		listener = MyEADStreamListener.new
		parser = EAD::EADStreamParser.new(listener)
		parser.parse(File.new(@test_file))
		
		assert(listener.eadheader, "Header was not imported")
		assert_equal("1", listener.eadheader.eadid.value)
		assert_equal("Teste", listener.eadheader.eadtitle.value)
		
		assert(listener.did, "DID was not imported")
		did = listener.did
		
		xmlstr = did.create_xml(REXML::Document.new).to_s
		assert_equal(did.__xml_text.tr(" \n\t",""), xmlstr.tr(" \n\t",""))
		
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
	
	def test_level_numbering
		dsc = EAD::EADSubordinates.new
		@ead.add_descelem(dsc)
		
		c01 = EAD::EADLevel.new
		dsc.add_level(c01)
		
		export
		
		listener = MyEADStreamListener2.new
		parser = EAD::EADStreamParser.new(listener)
		parser.parse(File.new(@test_file))
		
		assert(listener.dsc, "DSC was not imported")
		assert_equal(listener.dsc.element_id, listener.c01.parent_id)
	end
end
