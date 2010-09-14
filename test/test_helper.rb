$-w = true
require File.dirname(__FILE__) + '/../lib/eadcodec'
require 'test/unit'
require 'tmpdir'

class Test::Unit::TestCase
  DTD_PATH = File.dirname(__FILE__) + '/examples/'

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

  def xmllint_installed
    assert(system("xmllint --version > /dev/null 2>&1"), 
           "xmllint utility not installed"+
           "(on ubuntu/debian install package libxml2-utils)")
  end

  def validate_well_formed
    xmllint_installed
		assert(system("xmllint #{filepath} >/dev/null"), 
           "Validation failed for #{filepath}")
	end

  def validate_dtd
    xmllint_installed
    assert(system("xmllint --nonet --loaddtd --path #{DTD_PATH}"+
                  " #{filepath} > /dev/null"),
           "Validation failed for #{filepath}")
  end

  def compare_xpath(value, path)
		assert_equal(value.strip, XMLUtils::select_path(path, filepath).strip)
	end

  def element_exists(xpath, *args)
    assert(XMLUtils::element_exists(xpath, filepath), *args)
  end
end
