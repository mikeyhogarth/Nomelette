class ApplicationController < ActionController::Base
  	protect_from_forgery
  	helper_method :current_user

	protected
	def admin_only!
	    unless current_user && current_user.admin?
	      redirect_to root_path and return false
	    end
	end

	private
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

end
