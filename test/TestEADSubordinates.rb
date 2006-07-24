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
		dsc = EADCodec::Subordinates.new
		dsc.type = @type
		dsc << EADCodec::Head.new(@head)
		
		@ead.archdesc << dsc
		export
		compare_xpath(@type, "/ead/archdesc/dsc/@type")
		compare_xpath(@head, "/ead/archdesc/dsc/head")
	end

	def test_import
		import
		dsc = @ead.archdesc[:dsc]

		assert_equal(@type, dsc.type)
		assert_equal(@head, dsc[:head].value)
	end
end
