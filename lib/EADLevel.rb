module EAD
	class EADLevel < EADElement
		include EADLevels
		
		xmlattr :altrender
		xmlattr :audience
		xmlattr :encodinganalog
		xmlattr :id
		xmlattr :level
		xmlattr :otherlevel
		xmlattr :tpattern

		xmlsubel :did
		xmlsubel :phystech
		xmlsubel :scopecontent
		xmlsubel :note
		xmlsubel :relatedmaterial
		xmlsubel_mult :c
		
		attr_reader :parent
		
		elnames(*["c","c01","c02","c03","c04","c05","c06",
		          "c07","c08","c09","c10","c11","c12"])

		def initialize
			@unnumbered = false
		end

		def set_unnumbered
			@unnumbered = true
		end
		
		def set_numbered
			@unnumbered = false
		end
		
		def unnumbered?
		  if not instance_variables.index('@unnumbered')
		    @unnumbered = false
		  end
		  @unnumbered
		end

		def __parent=(parent)
			super
			if parent.unnumbered?
				self.set_unnumbered
			end
		end

    def description_level
      if __parent
        return __parent.description_level + 1
      else
        return 0
      end  
    end
  
    alias_method :oldelname, :elname # Just to shut up the warning
		def elname
			if unnumbered?
				return "c"
			end
			
			if description_level < 10
				return "c0" + description_level.to_s
			else
				return "c" + description_level.to_s
			end
		end
	end
end
