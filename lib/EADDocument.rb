require "EAD"
require "XMLUtils"

module EAD
  class EADArchDesc < EADElement
    elname "archdesc"
  
    xmlattr :level
    xmlsubel :did
    xmlsubel :bioghist
    xmlsubel :scopecontent
    xmlsubel :phystech
    xmlsubel_mult :dsc

    def initialize
      @level = "fonds"
    end
    
    def add_descelem(elem)
      dsc << elem
    end

    def descelems
      dsc.dup
    end
    
    def current_content
      text = create_open_tag+"\n"
      each_subel do |name|
        if not subel_mult?(name)
          value = send(name)
          if value
            doc = REXML::Document.new
            xml = value.create_xml(doc)
            doc.write(text,2)
          end
        end
      end
      text
    end
  end

  class EADDocument < EADElement
    elname "ead"
  
    COUNTRY_CODE = "pt"
    AGENCY_CODE = "iantt"

    xmlsubel :eadheader
    xmlsubel :archdesc

    def self.from_file(file)
      doc = REXML::Document.new(File.new(file))
      self.import_xml(doc.elements[1])
    end

    def initialize(id, title)
      self.eadheader = EADHeader.new(id, title)
      self.archdesc = EADArchDesc.new
    end

    def add_description(description)
      @archdesc.did = description
    end

    def ead_did
      @archdesc.did
    end

    def add_descelem(elem)
      @archdesc.add_descelem(elem)
    end

    def descelems
      @archdesc.descelems
    end

    def export(filename)
      doc = Document.new
      doc << XMLDecl.new("1.0", "UTF-8")
      doc << DocType.new("ead SYSTEM", '"file:///home/pedrocr/ead.dtd"')
      create_xml(doc)
      output = File.open(filename, "w")

      doc.write(output, 0)
      output.write "\n"
      output.close
    end
    
    def start_partial_export(file)
      if not already_partial_exported?
        file << "<?xml version='1.0' encoding='UTF-8'?>\n"
        file << "<!DOCTYPE ead SYSTEM \"file:///home/pedrocr/ead.dtd\">\n"
        super
      end
    end
  end
end
