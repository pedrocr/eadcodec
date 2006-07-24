require "TestEAD"
require "EADSubordinates"
require "EADLevel"
require "EADScopeContent"

class TestEADScopeContent < TestEAD
	def initialize(*args)
		super(*args)
		
		@test_file = "test_ead_scopecontent.xml"
		@head = "Test Head"
		@p = "Test p"
	end

	def test_attrs
		dsc = EADCodec::Subordinates.new
		@ead.archdesc << dsc
		
		c01 = EADCodec::Level.new
		dsc << c01
		
		sc = EADCodec::ScopeContent.new
		sc << EADCodec::Head.new(@head)
		sc << EADCodec::P.new(@p)
		sc << EADCodec::P.new(@p)
		c01 << sc
		
		export
		element_exists("/ead/archdesc/dsc/c/scopecontent", "Check that the scopecontent was added")
		compare_xpath(@head, "/ead/archdesc/dsc/c/scopecontent/head")
		compare_xpath(@p, "/ead/archdesc/dsc/c/scopecontent/p")
	end


	def test_import
		import
		assert_equal(1, @ead.archdesc[:dsc].find_all_named(:c).size)
		sc = @ead.archdesc[:dsc][:c][:scopecontent]
		assert_equal(@head, sc[:head].value)
		ps = sc.find_all_named(:p)
		assert_equal(@p, ps[0].value)
		assert_equal(@p, ps[1].value)
	end
end
