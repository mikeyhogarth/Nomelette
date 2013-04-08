class SessionsController < ApplicationController

	def new
	end

  	def create

	    user = User.find_by_username(params[:username])
	    
	    if(user && user.authenticate(params[:password]))
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
    		flash[:notice] = "Logged out"
    	end

    	redirect_to root_url
  	end
end
