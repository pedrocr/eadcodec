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
  sclass "PhysDesc", "physdesc"
  sclass "PhysLoc", "physloc"
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

  class Origination < EADElement
    elname "origination"
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :encodinganalog
    xmlattr :id
    xmlattr :label
    
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

  class UnitTitle < EADElement
    elname "unittitle"
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :encodinganalog
    xmlattr :id
    xmlattr :label
    xmlattr :type
    
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
  
  class UnitId < EADElement
    elname "unitid"
    
    xmlattr :altrender
    xmlattr :audience
    xmlattr :countrycode
    xmlattr :encodinganalog
    xmlattr :id
    xmlattr :identifier
    xmlattr :label
    xmlattr :repositorycode
    xmlattr :type
    
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
  
  # The class for the 'head' element. For convenience it can be initialized
  # with a string value that is used as the first subelement.
  class Head < EADElement
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
  class P < EADElement
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
require "EADLang"
require 'EADExtent'
require 'EADGeogName'
require 'EADRepository'
require 'EADAcqInfo'
require 'EADChronList'
require 'EADEvent'
require 'EADControlAccess'
require 'EADList'
require 'EADLabel'
require 'EADCustodHist'
require 'EADFilePlan'
require 'EADProcessInfo'
require 'EADName'
require 'EADDimensions'
require 'EADArrangement'
require 'EADContainer'
require 'EADAltFormAvail'
require 'EADPhysFacet'
require 'EADMaterialSpec'
require 'EADAppraisal'
require 'EADOtherFindAid'


module EADCodec
  def self.c_levels
     ["c","c01","c02","c03","c04","c05","c06","c07","c08","c09","c10","c11","c12"]
  end
               
  #c_levels.each{|level| ElClasses[level.to_sym] = EADLevel}
end
