$-w = true

require "test/unit"
require "xmlcodec"
require "EAD"
require "TestEAD"

class MyStreamListener
  attr_reader :ead
  def el_ead(el)
    @ead = el.get_object
  end
end

class MyConsumingStreamListener
  attr_reader :ead
  def el_ead(el)
    @ead = el.get_object
  end
    
  def el_c02(el)
    el.consume
  end
end

class TestXMLStreamObjectParser < TestEAD
  def initialize(*args)
    super(*args)
    
    @test_file = "test_ead_stream_object_parser.xml"
  end

  def test_import
    @ead.eadheader.id = "1"
  
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
    listener = MyStreamListener.new
    parser = XMLCodec::XMLStreamObjectParser.new(listener)
    parser.parse(File.new(@test_file))
    @ead = listener.ead
    
    assert_equal(@ead, parser.top_element)
    
    assert_equal("1", @ead.eadheader.eadid.value)
    assert_equal("1", @ead.eadheader.id)
    assert_equal("Teste", @ead.eadheader.eadtitle.value)
    
    dsc = @ead.descelems[0]
    assert(dsc.levels[0], "Check that the level was imported")
    assert(dsc.levels[0].did, "Check that the description was imported")
    assert(dsc.levels[0].levels[0], "Check that the second level was imported")
    assert(dsc.levels[0].levels[0].levels[0], "Check that the third level was imported")
  end
  
  def test_consume
    @ead.eadheader.id = "1"
  
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
    
    listener = MyConsumingStreamListener.new
    parser = XMLCodec::XMLStreamObjectParser.new(listener)
    parser.parse(File.new(@test_file))
    @ead = listener.ead    
    
    dsc = @ead.descelems[0]
    assert(dsc.levels[0], "Check that the level was imported")
    assert(dsc.levels[0].did, "Check that the description was imported")
    assert_equal(0, dsc.levels[0].levels.size, "Check that c03 was consumed")
  end
  
  def test_numbering
    @ead.eadheader.id = "1"
  
    dsc = EAD::EADSubordinates.new
    @ead.add_descelem(dsc)
    
    c01 = EAD::EADLevel.new
    c01.did = EAD::EADDescription.new
    c01.phystech = EAD::EADPhysTech.new
    dsc.add_level(c01)
    
    export
    
    listener = MyStreamListener.new
    parser = XMLCodec::XMLStreamObjectParser.new(listener)
    parser.parse(File.new(@test_file))
    @ead = listener.ead
    
    dsc = @ead.descelems[0]
    c01 = dsc.levels[0]
    
    assert(dsc.element_id)
    assert(dsc.parent_id)
    assert(c01.element_id)
    assert(c01.parent_id)
    assert_equal(c01.parent_id, dsc.element_id)
  end
end
