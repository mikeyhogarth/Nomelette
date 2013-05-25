class SessionsController < ApplicationController

	def new
		redirect_to :root_url if current_user
	end

	def modal_login
		render "sessions/user_login_modal", :layout => false
	end

	def new_admin
		render "admin/sessions/new"
	end

  	def create

  		#For debugging:
  		#raise request.env["omniauth.auth"].to_yaml

  		if(params[:provider])
  			auth = request.env["omniauth.auth"]
  			provider = auth["provider"]

			user = User.find_by_provider_and_uid(provider, auth["uid"]) || User.create_with_omniauth(auth)
			
			#These are temporary tokens just for this session only
			if(provider == "facebook")
				session[:facebook_access_token] = auth["credentials"]["token"]
			end

		else
	    	user = User.find_by_username(params[:username])	    	
	    	if(user)
	    		user = nil unless user.authenticate(params[:password])
	    	end
	    end


	    if(user)
	    	session[:user_id] = user.id
		    redirect_to root_url, :notice => "Logged in!"
		else
		    flash[:notice] = "Incorrect login details"	      
		    redirect_to login_path 
		end
	end

  	def destroy
  		if(session[:user_id])
    		
    		session[:user_id] = nil
    		session[:facebook_access_token] = nil

    		flash[:notice] = "Logged out"
    	end

    	redirect_to root_url
  	end
end
