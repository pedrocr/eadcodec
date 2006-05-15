$:.unshift File.join(File.dirname(__FILE__), "..")
$-w = true

require 'EAD'
require 'test/unit'
require 'XMLUtils'

class TestEAD < Test::Unit::TestCase
	def initialize(*args)
		super(*args)
		@test_file = nil
	end

	def setup
		@ead = EAD::EADDocument.new("1", "Teste")
	end

	def export 
		@ead.export(@test_file) 
	end
	
	def import
		@ead = EAD::EADDocument.from_file(@test_file)
	end

	def validate_well_formed
		assert(system("rxp", "-xs", @test_file))
	end

	def validate_dtd
		assert(system("rxp", "-VVs", @test_file))
		#assert(system("xmlstarlet", "val", "-d", "ead.dtd", @test_file))
	end

	def test_fake
		#Just a fake test to fool Unit::TestCase
	end

	def compare_xpath(value, path)
		assert_equal(value, select(path))
	end

	def element_exists(xpath, *args)
		assert(XMLUtils::element_exists(xpath, @test_file), *args)
	end

	def select(xpath)
		XMLUtils::select_path(xpath, @test_file)
	end
end
