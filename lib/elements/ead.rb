class Document < EADElement
  elname "ead"

  DTD_LOC = '"+//ISBN 1-931666-00-8//DTD ead.dtd '+
            '(Encoded Archival Description (EAD) Version 2002)//EN" "ead.dtd"'

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
    doc << REXML::DocType.new("ead PUBLIC", DTD_LOC)
    create_xml(doc)
    output = File.open(filename, "w")

    doc.write(output, 0)
    output.write "\n"
    output.close
  end
  
  def start_partial_export(file)
    if not already_partial_exported?
      file << "<?xml version='1.0' encoding='UTF-8'?>\n"
      file << "<!DOCTYPE ead PUBLIC #{DTD_LOC}>"
      super
    end
  end
end
