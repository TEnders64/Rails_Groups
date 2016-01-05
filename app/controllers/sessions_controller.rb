class SessionsController < ApplicationController
  def login
    puts 'login'

  	user = User.find_by_email(params[:user][:email])
  	if user && user.authenticate(params[:user][:password])
  		session[:user_id] = user.id
  		redirect_to '/groups'
  	else
      flash[:errors] = "User email and/or password don't match"
      redirect_to '/main'
    end
  end

  def logout
  	session[:user_id] = nil
  	redirect_to "/main"
  end
end
