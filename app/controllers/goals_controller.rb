class GoalsController < ApplicationController
 
  def new
    @goal = Goal.new
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def show
    @goal_list = GoalList.find(params[:goal_list_id])
    @goal = Goal.find(params[:id])
  end

  def create
    @goal_list = GoalList.find(params[:goal_list_id])
    @goals = @goal_list.goals

    @goal = current_user.goals.build(goal_params)
    @goal.goal_list = @goal_list
    @new_goal = Goal.new

    if @goal.save
      flash[:notice] = "Goal added!"
    else
      flash[:error] = "There was an error saving the goal. Please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @goal_list = GoalList.find(params[:goal_list_id])
    @goal = Goal.find(params[:id])


    @goal.complete = params[:complete]


    @goal.save
    # if @goal.update_attributes(goal_params)
    #   flash[:notice] = "Goal updated!"
    # else
    #   flash[:error] = "Failed to update goal. Please try again."
    # end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @goal_list = GoalList.find(params[:goal_list_id])
    @goal = @goal_list.goals.find(params[:id])

    if @goal.destroy
      flash[:notice] = "Goal was removed."
    else
      flash[:error] = "Goal couldn't be deleted. Try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def goal_params
    params.require(:goal).permit(:goal, :complete)
  end
end
