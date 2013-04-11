class ApplicationController < ActionController::Base
  	protect_from_forgery
  	helper_method :current_user
	
	private
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def admin_only!
	    unless current_user && current_user.admin?
	      redirect_to login_path and return false
	    end
	end

end
