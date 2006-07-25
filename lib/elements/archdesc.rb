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
