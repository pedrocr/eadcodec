require "rexml/document"
require "xmlcodec"
include REXML

# This module includes all the support for EAD import/export. The main class to
# use is EADDocument that is a subclass of XMLUtils::XMLElement. All elements
# supported are based on the EAD DTD and have the same names. Currently not all
# attributes and elements have been added. Adding an element is pretty easy 
# though.
module EAD
  class EADElement < XMLCodec::XMLElement #:nodoc:
  end
  
  class EADSimpleElement < EADElement
    elwithvalue
    
    def to_s
      value
    end
  end

  include XMLUtils
  # Module used in EADSubordinates and EADLevels to add new levels to a file
  module EADLevels
  public
    # Returns the list of all the child levels of the current element.
    def levels
      (self.c ||= []).dup
    end
  
    # Adds a child level to the current element.
    def add_level(level)
      self.c << level
    end
    
    # Removes a child level from the current element.
    def remove_level(level)
      self.c.delete(level)
    end
  end
  
  def self.sclass(name, string)
    const_set(name, Class.new(EADSimpleElement)).send(:elname, string) 
  end
  
  # Create a bunch of classes for simple elements with just values
  # Most of these actually can have children so they should be promoted to
  # actual classes.
  sclass "EADOrigination", "origination"
  sclass "EADUnitTitle", "unittitle"
  sclass "EADUnitId", "unitid"
  sclass "EADAbstract", "abstract"
  sclass "EADPhysDesc", "physdesc"
  sclass "EADPhysLoc", "physloc"
  sclass "EADAuthor", "author"
  sclass "EADSponsor", "sponsor"
  sclass "EADTitleProper", "titleproper"
  sclass "EADAbbr", "abbr"
  sclass "EADEmph", "emph"
  sclass "EADExpan", "expan"
  sclass "EADExtPtr", "extptr"
  sclass "EADLb", "lb"
  sclass "EADNum", "num"
  sclass "EADPtr", "ptr"
  sclass "EADArchRef", "archref"
  sclass "EADBibRef", "bibref"
  sclass "EADExtRef", "extref"
  sclass "EADRef", "ref"
  sclass "EADLinkGrp", "linkgrp"
  sclass "EADTitle", "title"
  
  # The class for the 'head' element. For convenience it can be initialized
  # with a string value that is used as the first subelement.
  class EADHead < EADElement
    elname "head"
    
    xmlattr :althead
    xmlattr :altrender
    xmlattr :audience
    xmlattr :id
      
    xmlsubelements
    
    def initialize(string=nil)
      if string
        self.subelements << string
      end
    end
    
    def value
      self.subelements[0].to_s
    end
  end
  
  # The class for the 'p' element. For convenience it can be initialized
  # with a string value that is used as the first subelement.
  class EADP < EADElement
    elname "p"
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :id
      
    xmlsubelements
    
    def initialize(string=nil)
      if string
        self.subelements << string
      end
    end
    
    def value
      self.subelements[0].to_s
    end
  end
  
end

require "EADDate"
require "EADSubtitle"
require "EADPhysTech"
require "EADScopeContent"
require "EADRelatedMaterial"
require "EADNote"
require "EADDescription"
require "EADLevel"
require "EADSubordinates"
require "EADProfileDesc"
require "EADHeader"
require "EADBiogHist"
require "EADDocument"

module EAD
  def self.c_levels
     ["c","c01","c02","c03","c04","c05","c06","c07","c08","c09","c10","c11","c12"]
  end
               
  #c_levels.each{|level| ElClasses[level.to_sym] = EADLevel}
end
