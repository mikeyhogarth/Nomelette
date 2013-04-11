module NomeletteHelpers

  class StringHelper

  	class << self
  		def remove_empty_lines(string_with_empty_lines)

        return string_with_empty_lines.squish if(string_with_empty_lines.lines.count == 1)          

		  	string_with_lines_removed = String.new

		  	string_with_empty_lines.each_line do |line|  		  		
		  		string_with_lines_removed << "#{line.squish}\n" unless line.squish.empty?
		  	end

		  	return string_with_lines_removed
  		end
  	end

  end

end