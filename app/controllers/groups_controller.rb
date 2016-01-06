class GroupsController < ApplicationController

  def index
  	@groups = Group.all
  	@user = User.select("first_name, last_name").find_by_id(session[:user_id])
  end
  
  def new
  end

  def create
  	group = Group.new( groups_params )
  	user = User.find(session[:user_id])
  	group[:user_id] = user.id
  	if group.valid?
  		group.save
  		Membership.create(:user_id => user.id, :group_id => Group.last.id)
  		# @groups = Group.all()
  		group = Group.last
  		count = group.members.count
  		authToken = form_authenticity_token
  		puts authToken
  		render json: {errors: false, group: group, count: count, token: authToken}
  	else
  		render json: {errors: true, messages: group.errors.full_messages}
  	end
  end

  def show
  end

  def destroy
  end

  private 
  	def groups_params
  		params.require(:group).permit(:title, :description)
  	end	
end
