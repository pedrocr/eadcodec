require "TestEAD"

class TestEADPhysTech < TestEAD
	def initialize(*args)
		super(*args)
		@test_file = "test_ead_phystech.xml"
		@head = "HEADTest"
		@ptext = "Some Text "
	end

	def test_export
		phystech = EAD::EADPhysTech.new
		phystech.head = @head
		(1..4).each {|i| phystech.p << EAD::EADP.new(@ptext+i.to_s)}
		
		did = EAD::EADDescription.new
		did.head = "head"
		did.unitid = "id"

		@ead.archdesc.phystech = phystech
		@ead.archdesc.did = did
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
		phystech = @ead.archdesc.phystech

		assert_equal(@head, phystech.head.value)
		(1..4).each do |i| 
			assert_equal(@ptext+i.to_s, phystech.p[i-1].value)
		end
	end
end