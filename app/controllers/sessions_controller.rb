class SessionsController < ApplicationController
  def login
    puts 'login'
  	user = User.find_by_email(params[:user][:email])
  	if user && user.authenticate(params[:user][:password])
  		session[:user_id] = user.id 
  		render json: {:errors => false, :url => "/groups"}
  	else
      render json: {:errors => true, :message => ["User email/password do not match"]}
  	end
  end

  def logout
  	session[:user_id] = nil
  	redirect_to "/main"
  end
end
