class TrackersController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @trackers = @user.trackers.all 
  end
  
  def show
    @user = User.find(params[:user_id])
    @tracker = Tracker.find(params[:id])
  end

  def new
    @tracker = Tracker.new
  end

  def edit
    @tracker = Tracker.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @tracker = Tracker.find(params[:id])

    if @tracker.update_attributes(tracker_params)
      redirect_to user_tracker_path, notice: "Update successful."
    else
      flash[:error] = "Failed to save update. Please try again."
      render :edit
    end
  end

  def create
    @user = User.find(params[:user_id])
    @trackers = @user.trackers
    @tracker = @user.trackers.build(tracker_params)
    @tracker.user = @user

    if @tracker.save
      redirect_to user_trackers_path, notice: "Keep up the hard work."
    else
      flash[:error] = "Failed to save your responses. Please try again."
      render :new
    end
  end

  private

  def tracker_params
    params.require(:tracker).permit(:workout, :nutrition, :weight, :goals, :health, :day)
  end
end
