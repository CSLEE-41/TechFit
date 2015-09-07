class EventsController < ApplicationController
  
  def index
    @user = User.find(params[:user_id])
    @events = @user.events.all
  end

  def edit
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @user = User.find(params[:user_id])
    @events = @user.events
    @event = @user.events.build(event_params)
    @event.user = @user

    if @event.save
      redirect_to user_events_path, notice: "Event saved!"
    else
      flash[:error] = "Failed to save the event. Please try again."
      render :new
    end
  end


  def update
    #reponsible for updating a particular event
    @event = Event.find(params[:id])

    if @event.update_attributes(event_params)
      redirect_to welcome_index_path, notice: "Event updated", status: 303
    else
      flash[:error] = "Failed to update event. Please try again."
      render :edit
    end
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:start, :end, :title)
  end
end
