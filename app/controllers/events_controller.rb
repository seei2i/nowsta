class EventsController < ApplicationController
  before_filter :find_page, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def new
  end

  def create
    @event = Event.new(event_params)
    @event.save
    redirect_to events_path, notice: "Event added sucessfully."
  end

  def edit
  end

  def show
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to events_path, :notice => "Event updated."
    else
      redirect_to events_path, :alert => "Unable to update event."
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, :notice => "Event deleted sucessfully."
  end

private

  def find_page
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :date, :time, :location, :id)
  end

end
