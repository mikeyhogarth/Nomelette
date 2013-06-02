module ApplicationHelper

  
	def page_title(title)
		content_for :title do
  			title
  		end
	end

  def page_description(description)
    content_for :description do
        strip_tags(description).squish
      end
  end

  def current_url
    "#{request.protocol}#{request.host_with_port}#{request.fullpath}"
  end

	#Comma selerated list for links such as categories
	def comma_seperated_links_for(list)
    	return if list.count == 0
    	list.sort { |x,y| x.name <=> y.name}.collect {|item| link_to(item.name, url_for(item)) }.join(", ").html_safe
  	end
  
  	#shows plural without including number
  	def pluralize_without_count count, singular, plural=nil
    	((count == 1 || count =~ /^1(\.0+)?$/) ? singular : (plural || singular.pluralize))
  	end
end
