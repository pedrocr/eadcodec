require "rexml/document"
require "xmlcodec"

# This module includes all the support for EAD import/export. The main class to
# use is EADDocument that is a subclass of XMLUtils::XMLElement. All elements
# supported are based on the EAD DTD and have the same names. Currently not all
# attributes and elements have been added. Adding an element is pretty easy 
# though.
module EADCodec
  class EADElement < XMLCodec::XMLElement #:nodoc:
  end
  
  class EADSimpleElement < EADElement
    elwithvalue
    
    def to_s
      value
    end
  end

  include XMLUtils
  
  def self.sclass(name, string)
    const_set(name, Class.new(EADSimpleElement)).send(:elname, string) 
  end
  
  # Create a bunch of classes for simple elements with just values
  # Most of these actually can have children so they should be promoted to
  # actual classes.
  sclass "Abstract", "abstract"
  sclass "Author", "author"
  sclass "Sponsor", "sponsor"
  sclass "TitleProper", "titleproper"
  sclass "Abbr", "abbr"
  sclass "Emph", "emph"
  sclass "Expan", "expan"
  sclass "ExtPtr", "extptr"
  sclass "Lb", "lb"
  sclass "Num", "num"
  sclass "Ptr", "ptr"
  sclass "ArchRef", "archref"
  sclass "BibRef", "bibref"
  sclass "ExtRef", "extref"
  sclass "Ref", "ref"
  sclass "LinkGrp", "linkgrp"
  sclass "Title", "title"

  
  
  # Module included in classes that have paragraphs as subelements
  module WithParagraphs
    def initialize(value=nil)
      value = [] if not value
      value = [value] if not value.is_a? Array
      value.each{|v| self << P.new(v)}
    end
  end
  
  # Module included in classes that have text and other elements as subelements
  module WithText
    def initialize(value=nil)
      value = [] if not value
      value = [value] if not value.is_a? Array
      value.each{|v| self << v}
    end
    
    def value
      self.subelements[0].to_s
    end
  end
end

Dir.glob(File.dirname(__FILE__)+'/elements/*.rb').each do |el|
  EADCodec.module_eval File.open(el).read
end
