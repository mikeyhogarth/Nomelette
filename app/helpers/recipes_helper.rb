module RecipesHelper

	def format_ingredient(ingredient)
		
		#escape any fractions to html codes and clear asterisks
        #snippet inspired by http://snippets.dzone.com/posts/show/2323
        ingredient.gsub(/\*/,"").gsub(/\d\/\d/) do |match|
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
          when "*" then ""
          else match
          end
        end.html_safe

	end
end
