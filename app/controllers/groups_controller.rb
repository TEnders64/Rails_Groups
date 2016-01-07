class GroupsController < ApplicationController

  def index
  	@groups = Group.all
  	@user = User.select("first_name, last_name").find_by_id(session[:user_id])
  end

  def create
  	@group = Group.new( groups_params )
  	user = User.find(session[:user_id])
  	@group[:user_id] = user.id
  	if @group.valid?
  		@group.save
  		Membership.create(:user_id => user.id, :group_id => Group.last.id)
  		# @groups = Group.all()
  		@group = Group.last
  		count = @group.members.count

      render :partial => 'new_org', :object => @group

  	else
  		render json: {errors: true, messages: group.errors.full_messages}
  	end
  end


  def show
    @group = Group.find(params[:id])

    @membership = false

    @group.members.each do |member|
      if member.id == session['user_id']
        @membership = true
      end
    end

  end

  def update

    if params[:type] == 'join'
      Group.find(params[:id]).memberships.create(:user_id => session[:user_id])
      user = User.select('first_name, last_name').find(session[:user_id])
      render json: {message: 'joined', user: user}

    elsif params[:type] == 'leave'
      membership = Membership.find_by(:group_id => params[:id], :user_id => session[:user_id])
      membership.destroy()

      render json: {message: 'removed'}
    end
    puts params

  end

  def destroy
    group_to_delete = params[:id]

    Group.destroy(group_to_delete);

    render json: {message: 'Deleted'}

  end

  private 
  	def groups_params
  		params.require(:group).permit(:title, :description)
  	end	
end
