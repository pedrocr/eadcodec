require "TestEAD"
require "EADSubordinates"
require "EADLevel"

class TestEADLevel < TestEAD
	def initialize(*args)
		super(*args)
		
		@test_file = "test_ead_level.xml"
	end

	def test_attrs
		dsc = EAD::EADSubordinates.new
		@ead.add_descelem(dsc)
		
		c01 = EAD::EADLevel.new
		c01.did = EAD::EADDescription.new
		c01.phystech = EAD::EADPhysTech.new
		dsc.add_level(c01)
	
		c02 = EAD::EADLevel.new
		c01.add_level(c02)

		c03 = EAD::EADLevel.new
		c02.add_level(c03)

		export
		element_exists("/ead/archdesc/dsc/c01", "Check that the level was added")
		element_exists("/ead/archdesc/dsc/c01/did", "Check that the description was added")
		element_exists("/ead/archdesc/dsc/c01/phystech", "Check that the phystech was added")
		element_exists("/ead/archdesc/dsc/c01/c02", "Check that the second level was added")
		element_exists("/ead/archdesc/dsc/c01/c02/c03", "Check that the third level was added")
	end

	def test_import
		import
		dsc = @ead.descelems[0]
		assert(dsc.levels[0], "Check that the level was imported")
		assert(dsc.levels[0].did, "Check that the description was imported")
		assert(dsc.levels[0].levels[0], "Check that the second level was imported")
		assert(dsc.levels[0].levels[0].levels[0], "Check that the third level was imported")
	end
	
	def test_attrs_unnumbered
		dsc = EAD::EADSubordinates.new
		@ead.add_descelem(dsc)
		
		c01 = EAD::EADLevel.new
		c01.set_unnumbered
		c01.did = EAD::EADDescription.new
		c01.phystech = EAD::EADPhysTech.new
		dsc.add_level(c01)
	
		c02 = EAD::EADLevel.new
		c01.add_level(c02)

		c03 = EAD::EADLevel.new
		c02.add_level(c03)

		export
		element_exists("/ead/archdesc/dsc/c", "Check that the level was added")
		element_exists("/ead/archdesc/dsc/c/did", "Check that the description was added")
		element_exists("/ead/archdesc/dsc/c/phystech", "Check that the phystech was added")
		element_exists("/ead/archdesc/dsc/c/c", "Check that the second level was added")
		element_exists("/ead/archdesc/dsc/c/c/c", "Check that the third level was added")
	end
	
	def test_import_unnumbered
		import
		dsc = @ead.descelems[0]
		assert(dsc.levels[0], "Check that the level was imported")
		assert(dsc.levels[0].did, "Check that the description was imported")
		assert(dsc.levels[0].levels[0], "Check that the second level was imported")
		assert(dsc.levels[0].levels[0].levels[0], "Check that the third level was imported")
	end
end
