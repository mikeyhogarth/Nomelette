module NomeletteHelpers

  class StringHelper

  	class << self
  		def remove_empty_lines(string_with_empty_lines)
        return String.new unless string_with_empty_lines

        return string_with_empty_lines.squish if(string_with_empty_lines and string_with_empty_lines.lines.count == 1)          

		  	string_with_lines_removed = String.new

		  	string_with_empty_lines.each_line do |line|  		  		
		  		string_with_lines_removed << "#{line.squish}\n" unless line.squish.empty?
		  	end

		  	return string_with_lines_removed
  		end


      def format_ingredient(ingredient)    
          #escape any fractions to html codes and clear asterisks
          #snippet inspired by http://snippets.dzone.com/posts/show/2323
          ingredient.gsub(/\d\/\d/) do |match|
            case match
              when "1/2" then '&frac12;' # One half
              when "1/4" then '&frac14;' # One quarter
              when "3/4" then '&frac34;' # Three quarters
              when "1/3" then '&#x2153;' # One third
              when "2/3" then '&#x2154;' # Two thirds
              when "1/5" then '&#x2155;' # One fifth
              when "2/5" then '&#x2156;' # Two fifths
              when "3/5" then '&#x2157;' # Three fifths
              when "4/5" then '&#x2158;' # Four fifths
              when "1/6" then '&#x2159;' # One sixth
              when "5/6" then '&#x215A;' # Five sixths
              when "1/8" then '&#x215B;' # One eighth
              when "3/8" then '&#x215C;' # Three eighths
              when "5/8" then '&#x215D;' # Five eighths
              when "7/8" then '&#x215E;' # Seven eighths            
            else match
          end
        end
      end


    end
  end
end
