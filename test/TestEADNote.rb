require "TestEAD"
require "EADNote"

class TestEADNote < TestEAD
	def initialize(*args)
		super(*args)
		
		@test_file = "test_ead_note.xml"
		@p = "Test p"
	end

	def test_attrs
		dsc = EADCodec::Subordinates.new
		@ead.archdesc << dsc
		
		c01 = EADCodec::Level.new
		dsc << c01
		
		note = EADCodec::Note.new
		note << EADCodec::P.new(@p)
		note << EADCodec::P.new(@p)
		c01 << note
		
		export
		element_exists("/ead/archdesc/dsc/c/note", "Check that the note was added")
		compare_xpath(@p, "/ead/archdesc/dsc/c/note/p")
	end


	def test_import
		import
		note = @ead.archdesc[:dsc][:c][:note]
		ps = note.find_all_named(:p)
		assert_equal(@p, ps[0].value)
		assert_equal(@p, ps[1].value)
	end
end
