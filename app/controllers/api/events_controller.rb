class Api::EventsController < Api::ApplicationController
  def event_params
    params.require(:event).permit(:title, :desc, :image)
  end

  def index
  end

  def create
    @event = Event.new(event_params)
    @event.save

  end
end
