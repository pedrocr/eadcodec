require File.dirname(__FILE__) + '/test_helper'

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
    
  def el_c(el)
    el.consume
  end
end

class TestXMLStreamObjectParser < Test::Unit::TestCase
  def initialize(*args)
    super(*args)
    
    @test_file = "test_ead_stream_object_parser.xml"
  end

  def test_import
    @ead.eadheader.id = "1"
  
    dsc = EADCodec::Subordinates.new
    @ead.archdesc << dsc
    
    c01 = EADCodec::Level.new
    c01 << EADCodec::Description.new
    c01 << EADCodec::PhysTech.new
    dsc << c01
  
    c02 = EADCodec::Level.new
    c01 << c02

    c03 = EADCodec::Level.new
    c02 << c03

    export
    listener = MyStreamListener.new
    parser = XMLCodec::XMLStreamObjectParser.new(listener)
    parser.parse(File.new(filepath))
    @ead = listener.ead
    
    assert_equal(@ead, parser.top_element)
    
    assert_equal("1", @ead.eadheader.eadid.value)
    assert_equal("1", @ead.eadheader.id)
    assert_equal("Teste", @ead.eadheader.eadtitle.value)
    
    dsc = @ead.archdesc[:dsc]
    assert(dsc[:c], "Check that the level was imported")
    assert(dsc[:c][:did], "Check that the description was imported")
    assert(dsc[:c][:c], "Check that the second level was imported")
    assert(dsc[:c][:c][:c], "Check that the third level was imported")
  end
  
  def test_consume
    @ead.eadheader.id = "1"
  
    dsc = EADCodec::Subordinates.new
    @ead.archdesc << dsc
    
    c01 = EADCodec::Level.new
    c01 << EADCodec::Description.new
    c01 << EADCodec::PhysTech.new
    dsc << c01
  
    c02 = EADCodec::Level.new
    c01 << c02

    c03 = EADCodec::Level.new
    c02 << c03

    export
    
    listener = MyConsumingStreamListener.new
    parser = XMLCodec::XMLStreamObjectParser.new(listener)
    parser.parse(File.new(filepath))
    @ead = listener.ead    
    
    dsc = @ead.archdesc[:dsc]
    assert_nil(dsc[:c], "Check that the levels were consumed")
  end
  
  def test_numbering
    @ead.eadheader.id = "1"
  
    dsc = EADCodec::Subordinates.new
    @ead.archdesc << dsc
    
    c01 = EADCodec::Level.new
    c01 << EADCodec::Description.new
    c01 << EADCodec::PhysTech.new
    dsc << c01
    
    export
    
    listener = MyStreamListener.new
    parser = XMLCodec::XMLStreamObjectParser.new(listener)
    parser.parse(File.new(filepath))
    @ead = listener.ead
    
    dsc = @ead.archdesc[:dsc]
    c01 = dsc[:c]
    
    assert(dsc.element_id)
    assert(dsc.parent_id)
    assert(c01.element_id)
    assert(c01.parent_id)
    assert_equal(c01.parent_id, dsc.element_id)
  end
end
