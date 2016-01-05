class UsersController < ApplicationController
  def new

  end

  def create
  	user = User.new( user_params )
  	user.password_confirmation = params[:user][:password_confirm]
  	if user.valid?
  		user.save
  		flash[:message] = "User registered successfully, Please log in"
  	else
  		flash[:errors] = user.errors.full_messages
  	end
  	# redirect_to "/main"
  	render json: {:message => "Hello World", :errors => "Errors go here"}
  end

  private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :password)
  	end
end
