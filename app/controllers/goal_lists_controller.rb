class GoalListsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @goal_lists = @user.goal_lists.all
  end

  def new
    @goal_list = GoalList.new
  end

  def edit
    @goal_list = GoalList.find(params[:id])
  end

  def show
    @user = User.find(params[:user_id])
    @goal_list = GoalList.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @goal_lists = @user.goal_lists
    @goal_list = @user.goal_lists.build(goal_list_params)
    @goal_list.user = @user

    if @goal_list.save
      redirect_to user_goal_lists_path, notice: 'Goals were saved successfully.'
    else
      flash[:error] = 'Failed to save goals. Please try again.'
      render :new
    end
  end

  def update
    @user = User.find(params[:user_id])
    @goal_list = GoalList.find(params[:id])

    if @goal_list.update_attributes(goal_list_params)
      redirect_to user_goal_list_path, notice: "Successfully updated goals."
    else
      flash[:error] = "Failed to update goals. Please try again."
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @goal_list = GoalList.find(params[:id])

    if @goal_list.destroy
      flash[:notice] = "\"#{@goal_list.id}\" was successfully deleted."
      redirect_to user_goal_lists_path
    else
      flash[:error] = "Failed to delete list of goals. Please try again."
      render :show
    end
  end

  def goal_list_params
    params.require(:goal_list).permit(:goal_one, :goal_two, :goal_three, :goal_four, :start_date, :end_date, :current_weight, :goal_weight)
  end
end
