class UsersController < ApplicationController
  def new

  end

  def create
    puts 'Users#create'
  	user = User.new( user_params )

  	user.password_confirmation = params[:user][:password_confirm]

  	if user.valid?
  		user.save
      render json: {:errors => false, :message => "User registered successfully, Please log in"}
  	else
      render json: {:errors => true, :message => user.errors.full_messages}
  	end
  end

  private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :password)
  	end
end
