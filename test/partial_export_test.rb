require File.dirname(__FILE__) + '/test_helper'

class TestPartialExport < Test::Unit::TestCase
  def setup
    super
    @test_file = "test_ead_partial_export.xml"
    @head = "Test head"
    @type = "combined"
  end

  def test_partial_export
    file = File.open(filepath, "w")
    
    did = EADCodec::Description.new
    did << EADCodec::Head.new("abc")
    did << EADCodec::UnitId.new("teste")
    @ead.archdesc << did
    
    dsc = EADCodec::Subordinates.new
    dsc.type = @type
    @ead.archdesc << dsc
    
    c01 = EADCodec::Level.new
    did = EADCodec::Description.new
    did << EADCodec::Head.new("abc")
    did << EADCodec::UnitId.new("teste")
    did << EADCodec::UnitTitle.new("teste")
    c01 << did
    
    dsc << c01
    c01.start_partial_export(file)
    
    dsc = EADCodec::Subordinates.new
    dsc.type = @type
    c01 << dsc
    
    c02 = EADCodec::Level.new
    did = EADCodec::Description.new
    did << EADCodec::Head.new("abc")
    did << EADCodec::UnitId.new("teste")
    did << EADCodec::UnitTitle.new("teste")
    c02 << did
    sc = EADCodec::ScopeContent.new
    sc << EADCodec::P.new('value1')
    sc << EADCodec::P.new('value2')
    c02 << sc
    
    dsc << c02
    c02.start_partial_export(file)
    
    @ead.end_partial_export(file)
    
    file.close
    
    validate_dtd
    compare_xpath("fonds", "/ead/archdesc/@level")
    compare_xpath(@type, "/ead/archdesc/dsc/@type")
    element_exists("/ead/archdesc/dsc/c", "the first level was not added")
    element_exists("/ead/archdesc/dsc/c/did", "the first level description was not added")
    element_exists("/ead/archdesc/dsc/c/dsc/c", "the second level was not added")
    element_exists("/ead/archdesc/dsc/c/dsc/c/did", "the second level description was not added")
  end
end
