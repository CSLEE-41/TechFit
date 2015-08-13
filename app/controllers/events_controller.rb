class EventsController < ApplicationController
  def index
  end

  def edit

  end

  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(params.require(:event).permit(:start, :end, :title))
      redirect_to welcome_index_path, notice: "Event updated", status: 303
    else
      flash[:error] = "Failed to update event. Please try again."
      render :edit
    end
  end

  def destroy
  end
end
