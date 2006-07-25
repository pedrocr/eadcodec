require "TestEAD"

class TestEADLevel < TestEAD
	def initialize(*args)
		super(*args)
	end

  def export_doc(opt)
    dsc = EADCodec::Subordinates.new
		@ead.archdesc << dsc
		
		c01 = EADCodec::Level.new
		c01.set_unnumbered if opt == :unnumbered
		c01 << EADCodec::Description.new
		c01 << EADCodec::PhysTech.new
		dsc << c01
	
		c02 = EADCodec::Level.new
		c01 << c02

		c03 = EADCodec::Level.new
		c02 << c03
		
		@test_file = 'test_ead_level_'+opt.to_s+'.xml'
		export @test_file
  end

	#def test_attrs
	#	export_doc(:numbered)
	#	element_exists("/ead/archdesc/dsc/c01", "Check that the level was added")
	#	element_exists("/ead/archdesc/dsc/c01/did", "Check that the description was added")
	#	element_exists("/ead/archdesc/dsc/c01/phystech", "Check that the phystech was added")
	#	element_exists("/ead/archdesc/dsc/c01/c02", "Check that the second level was added")
	#	element_exists("/ead/archdesc/dsc/c01/c02/c03", "Check that the third level was added")
	#end

	#def test_import
	#  export_doc(:numbered)
	#	import
	#	dsc = @ead.archdesc.find_first_named(:dsc)
	#	
	#	c01 = dsc.find_first_named(:c01)
	#	assert(c01, "Check that the level was imported")
	#	assert(c01.find_first_named(:did), "Check that the description was imported")
	#	
	#	c02 = c01.find_first_named(:c02)
	#	assert(c02, "Check that the second level was imported")
	#	assert(c02.find_first_named(:c03), "Check that the third level was imported")
	#end
	
	def test_attrs_unnumbered
	  @test_file = "test_ead_level_unnumbered.xml"
		export_doc(:unnumbered)
		export
		element_exists("/ead/archdesc/dsc/c", "Check that the level was added")
		element_exists("/ead/archdesc/dsc/c/did", "Check that the description was added")
		element_exists("/ead/archdesc/dsc/c/phystech", "Check that the phystech was added")
		element_exists("/ead/archdesc/dsc/c/c", "Check that the second level was added")
		element_exists("/ead/archdesc/dsc/c/c/c", "Check that the third level was added")
	end
	
	def test_import_unnumbered
	  @test_file = "test_ead_level_unnumbered.xml"
	  export_doc(:unnumbered)
		import
		dsc = @ead.archdesc[:dsc]
		c01 = dsc[:c]
		assert(c01, "Check that the level was imported")
		assert(c01[:did], "Check that the description was imported")
		
		c02 = c01[:c]
		assert(c02, "Check that the second level was imported")
		assert(c02[:c], "Check that the third level was imported")
	end
end
