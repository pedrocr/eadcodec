require "TestEAD"

class TestEADPhysTech < TestEAD
	def initialize(*args)
		super(*args)
		@test_file = "test_ead_phystech.xml"
		@head = "HEADTest"
		@ptext = "Some Text "
	end

	def test_export
		phystech = EADCodec::PhysTech.new
		phystech << EADCodec::Head.new(@head)
		(1..4).each {|i| phystech << EADCodec::P.new(@ptext+i.to_s)}
		
		did = EADCodec::Description.new
		did << EADCodec::Head.new("head")
		did << EADCodec::UnitId.new("id")

		@ead.archdesc << did
 		@ead.archdesc << phystech
		export

		# Since we've added content it is now valid EAD
		validate_dtd

		element_exists("/ead/archdesc/phystech", "Test did exists")
		compare_xpath(@head, "/ead/archdesc/phystech/head")
		(1..4).each do |i| 
			compare_xpath(@ptext+i.to_s, "/ead/archdesc/phystech/p["+i.to_s+"]")
		end
	end


	def test_import
		import
		phystech = @ead.archdesc[:phystech]

		assert_equal(@head, phystech[:head].value)
		ps = phystech.find_all_named(:p)
		(1..4).each do |i| 
			assert_equal(@ptext+i.to_s, ps[i-1].value)
		end
	end
end
