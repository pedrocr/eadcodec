require "XMLUtils"

module EADCodec
  class ArchDesc < EADElement
    elname "archdesc"
  
    xmlattr :altrender
    xmlattr :audience
    xmlattr :encodinganalog
    xmlattr :id
    xmlattr :level
    xmlattr :otherlevel
    xmlattr :relatedencoding
    xmlattr :type
    
    xmlsubelements
    def initialize
      @level = "fonds"
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

  class Document < EADElement
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
      self.eadheader = Header.new(id, title)
      self.archdesc = ArchDesc.new
    end

    def export(filename)
      doc = REXML::Document.new
      doc << REXML::XMLDecl.new("1.0", "UTF-8")
      doc << REXML::DocType.new("ead SYSTEM", '"file:///home/pedrocr/ead.dtd"')
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
