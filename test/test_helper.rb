$-w = true
require File.dirname(__FILE__) + '/../lib/eadcodec'
require 'test/unit'
require 'tmpdir'

class Test::Unit::TestCase
  alias_method :old_setup, :setup
  def setup
    @ead = EADCodec::Document.new("1", "Teste")
  end

  def filepath(name=nil)
    name = @test_file if not name
    File.join(Dir::tmpdir, name)
  end

  def export(name=nil)
    @ead.export filepath(name) 
  end
  
  def import
    @ead = EADCodec::Document.from_file filepath
  end

  def validate_well_formed
    assert(system("rxp", "-xs", filepath))
  end

  def validate_dtd
    assert(system("rxp", "-VVs", filepath))
    #assert(system("xmlstarlet", "val", "-d", "ead.dtd", @test_file))
  end

  def compare_xpath(value, path)
    assert_equal(value, select(path))
  end

  def element_exists(xpath, *args)
    assert(XMLUtils::element_exists(xpath, filepath), *args)
  end

  def select(xpath)
    XMLUtils::select_path(xpath, filepath)
  end
end
