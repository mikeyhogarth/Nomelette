require 'json'

module ThirdParty
  class Wikipedia
  	include HTTParty
  	base_uri 'http://en.wikipedia.org/w/api.php'
  	format :json
  	
  	def get_description_for(ingredient)
  		response = self.class.get("/", 
  			:headers => {"User-Agent" => "Nomelette/0.5 (http://www.nomelette.co.uk/)"},
  			:query => {:format=>"json", :action=>"query",:prop=>"extracts",:exsentences=>"10",:titles=>ingredient, :redirects => ""})
   		return response.parsed_response["query"]["pages"].first[1]["extract"]
	  end

  end
end