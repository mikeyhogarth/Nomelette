module FacebookHelper
	def facebook_session_token
		session[:facebook_access_token]
	end
end