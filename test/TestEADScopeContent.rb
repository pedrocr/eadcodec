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
		dsc = EAD::EADSubordinates.new
		@ead.add_descelem(dsc)
		
		c01 = EAD::EADLevel.new
		dsc.add_level(c01)
		
		sc = EAD::EADScopeContent.new
		sc.head = @head
		sc.p << EAD::EADP.new(@p)
		sc.p << EAD::EADP.new(@p)
		c01.scopecontent = sc
		
		export
		element_exists("/ead/archdesc/dsc/c01/scopecontent", "Check that the scopecontent was added")
		compare_xpath(@head, "/ead/archdesc/dsc/c01/scopecontent/head")
		compare_xpath(@p, "/ead/archdesc/dsc/c01/scopecontent/p")
	end


	def test_import
		import
		assert_equal(1, @ead.archdesc.dsc[0].c.size)
		sc = @ead.archdesc.dsc[0].c[0].scopecontent
		assert_equal(@head, sc.head.value)
		assert_equal(@p, sc.p[0].value)
		assert_equal(@p, sc.p[1].value)
	end
end
