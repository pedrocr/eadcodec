require "TestEAD"

class TestPartialExport < TestEAD
  def setup
    super
    @test_file = "test_ead_partial_export.xml"
    @head = "Test head"
    @type = "combined"
  end

  def test_partial_export
    file = File.open(@test_file, "w")
    
    did = EAD::EADDescription.new
    did.head = "abc"
    did.unitid = "teste"
    @ead.archdesc.did = did
    
    dsc = EAD::EADSubordinates.new
    dsc.type = @type
    @ead.archdesc.dsc << dsc
    
    c01 = EAD::EADLevel.new
    c01.did = EAD::EADDescription.new
    c01.did.head = "abc"
    c01.did.unitid = "teste"
    
    dsc.c << c01
    c01.partial_export(file)
    
    c01 = EAD::EADLevel.new
    c01.did = EAD::EADDescription.new
    c01.did.head = "abc"
    c01.did.unitid = "teste"
    sc = EAD::EADScopeContent.new
    sc.p << EAD::EADP.new('value1')
    sc.p << EAD::EADP.new('value2')
    c01.scopecontent = sc
    
    dsc.c << c01
    c01.partial_export(file)
    
    @ead.end_partial_export(file)
    
    file.close
    
    validate_dtd
    compare_xpath("fonds", "/ead/archdesc/@level")
    compare_xpath(@type, "/ead/archdesc/dsc/@type")
    element_exists("/ead/archdesc/dsc/c01", "Check that the level was added")
    element_exists("/ead/archdesc/dsc/c01/did", "Check that the description was added")
  end
end
