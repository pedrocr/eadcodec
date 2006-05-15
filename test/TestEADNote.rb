require "TestEAD"
require "EADNote"

class TestEADNote < TestEAD
	def initialize(*args)
		super(*args)
		
		@test_file = "test_ead_note.xml"
		@p = "Test p"
	end

	def test_attrs
		dsc = EAD::EADSubordinates.new
		@ead.add_descelem(dsc)
		
		c01 = EAD::EADLevel.new
		dsc.add_level(c01)
		
		sc = EAD::EADNote.new
		sc.p << EAD::EADP.new(@p)
		sc.p << EAD::EADP.new(@p)
		c01.note = sc
		
		export
		element_exists("/ead/archdesc/dsc/c01/note", "Check that the scopecontent was added")
		compare_xpath(@p, "/ead/archdesc/dsc/c01/note/p")
	end


	def test_import
		import
		note = @ead.descelems[0].levels[0].note
		assert_equal(@p, note.p[0].value)
		assert_equal(@p, note.p[1].value)
	end
end
