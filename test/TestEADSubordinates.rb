require "TestEAD"
require "EADSubordinates"

class TestEADSubordinates < TestEAD

	def initialize(*args)
		super(*args)

		@test_file = "test_ead_subordinates.xml"

		@type = "combined"
		@head = "Some head"
	end

	def test_attrs
		dsc = EAD::EADSubordinates.new
		dsc.type = @type
		dsc.head = @head
		
		@ead.add_descelem(dsc)
		export
		compare_xpath(@type, "/ead/archdesc/dsc/@type")
		compare_xpath(@head, "/ead/archdesc/dsc/head")
	end

	def test_import
		import
		dsc = @ead.descelems[0]

		assert_equal(@type, dsc.type)
		assert_equal(@head, dsc.head.value)
	end
end
