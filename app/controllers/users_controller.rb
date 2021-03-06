class UsersController < ApplicationController
  
  def index
    @users = User.all 
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events
     
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to user_path
    else
      flash[:error] = "Invalid User Information"
      redirect_to edit_user_registration_path
    end
  end

  private 

  def user_params
    params.require(:user).permit(:name, :avatar, :avatar_cache)
  end
end

